[Back](../../README.md)

## Artificial Intelligence

- [Agent Skills](./skills.md)
- [Claude Code](./claude-code.md)

### System Prompts / "How To Talk To Me"

Customizing how the LLM should communicate with the user

> - If you need more details, ask me questions instead of making assumptions
> - If you do not have information, say that you do not know
> - Provide information in a concise and to-the-point manner.
> - Be extremely concise; Sacrifice grammar for the sake of concision
> - Avoid long text, prefer bullet points
> - Don't be sycophantic
> - Use casual communication style.
> - Skip introductions and summaries unless asked

### Prompts

#### Practices

**Be clear and direct**

**Structure prompts with XML**

Use XML tags to wrap and delineate different parts of your prompt, such as instructions, input data, or examples. This technique helps organize complex prompts with multiple components.

**Use examples: The power of learning by demonstration**

Provide output examples via <examples><example>...</example></examples> tags.

**Chain-of-thought prompting**

Technique where you explicitly instruct LLM to break down complex problems or questions into a series of logical steps, articulate its reasoning at each step, and then use that reasoning to provide a final answer or solution. It's akin to asking a colleague to "think out loud" while solving a problem.

Provide a place to put its thoughts before generating an answer. Consider using XML tags like <thinking> and <answer>.

**Role prompting**

By assigning a role to LLM, you can prime it to respond in a specific way, improve its accuracy and performance, and tailor its tone and demeanor to match the desired context.

#### Examples

> Please quote the phrases mentioned in the sources without paraphrasing.

To reduce the halucinations in the results

## Other

### Resources

- ThoughtWorks:
  - [Knowledge Priming](https://martinfowler.com/articles/reduce-friction-ai/knowledge-priming.html) - Building good context foundations (AGENTS.md / CLAUDE.md etc.)
  - [Design-First Collaboration](https://martinfowler.com/articles/reduce-friction-ai/design-first-collaboration.html) - Creating the plan before building the solution
  - [Context Anchoring](https://martinfowler.com/articles/reduce-friction-ai/context-anchoring.html) - Capturing key decisions
  - [Encoding Team Standards](https://martinfowler.com/articles/reduce-friction-ai/encoding-team-standards.html) - Converting knowledge and experience of people into AI usable instructions (skills/rules/commands etc.)
  - [Feedback Flywheel](https://martinfowler.com/articles/reduce-friction-ai/feedback-flywheel.html) - Maintaining and iteratively improving the above
- Rules for coding https://10xrules.ai/
- https://github.com/x1xhlol/system-prompts-and-models-of-ai-tools

[Back](../../README.md)
