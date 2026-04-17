[Back](../../README.md)

[Node.js](https://nodejs.org/en)

## Peer Dependency Best Practices

1. Use peers for instance-sensitive or host-owned packages

When to make something a peer dep: React, React DOM, Vue, Apollo Client, a state store, a plugin host (ESLint, Webpack, Jest). Anything where two copies in one process = bugs (broken hooks, duplicate context, failed instanceof checks, doubled singletons).

When NOT to make something a peer: small utilities (lodash helpers, date libs), internal implementation details, anything the consumer shouldn't need to know about. Those belong in dependencies.

Why it matters: peers exist to enforce a single hoisted copy. If identity doesn't matter, peers just add friction without benefit.

2. Declare peer deps in peerDependencies and devDependencies

```
{
  "peerDependencies": {
    "react": "^18.0.0 || ^19.0.0"
  },
  "devDependencies": {
    "react": "^18.2.0"
  }
}
```

Why: the peer entry is a contract with future consumers (a range). The dev entry is what you build and test against in your repo (a specific version). npm does not auto-install peer deps of the root package into your library's own node_modules — tests and type-checks need the devDep to resolve imports.

Rule of thumb: dev against the lowest version in your peer range so you catch accidental use of newer APIs. Test the upper bound in CI.

3. Keep peer ranges as wide as you actually support

```
"peerDependencies": {
  "react": "^18.0.0 || ^19.0.0"   // good — supports both majors
}
```

Narrow ranges ("react": "18.2.1") cause ERESOLVE failures for consumers the moment they bump a minor. Every tightening should be justified by a real incompatibility.

Why it matters in npm 7+: the resolver now errors out on unsatisfiable peers instead of warning. Tight peer ranges translate directly into broken installs for downstream users.

4. Don't use --force or --legacy-peer-deps to silence errors — understand them first

When ERESOLVE fires, it's telling you something real: two things in the tree disagree about a package's version.

- --legacy-peer-deps reverts to npm 6 behavior (warn, don't install, don't enforce). Use only when you genuinely need npm-6-style behavior — for example, migrating a large legacy monorepo incrementally. Globally enabling this via .npmrc hides real version conflicts.
- --force may nest duplicate copies. For peer-style packages (React, Apollo), this causes the exact bugs peer deps exist to prevent. Almost never the right answer.

The right answer is usually: widen one peer range, upgrade the conflicting dep, or use overrides (see #6).

5. Use overrides in the host to resolve version conflicts cleanly

```
// host app's package.json
{
  "overrides": {
    "PckgX": "^2.3.0"
  }
}
```

Why: overrides tells npm "regardless of what any dependency declares, pin this version everywhere in the tree." This is the modern, targeted replacement for --force when you have a legitimate reason to override a
peer (e.g., a library's peer range hasn't been updated yet but you've verified compatibility).

Overrides are surgical; --force is a sledgehammer.

6. Understand the lockfile's `"peer": true` flag — don't remove peers to "clean it up"

The `"peer": true` annotation in package-lock.json tells the resolver "this node is satisfying peer edges in the tree," which affects future deduplication and uninstall behavior. I.e. it is added for each package that is a peer dependency of a dependency.

7. In monorepos, hoist peer deps at the workspace root

For npm workspaces, pnpm, yarn workspaces: declare host-owned packages (React, etc.) once at the root package.json, not in every workspace package. Each internal library keeps them as peers. This guarantees a
single instance across all packages and prevents the "two Reacts" class of bug inside the monorepo itself.

```
root/package.json          → dependencies: { react: "^18.2.0" }
root/packages/lib-a/       → peerDependencies: { react: "^18.0.0" }
root/packages/lib-b/       → peerDependencies: { react: "^18.0.0" }
```

[Back](../../README.md)
