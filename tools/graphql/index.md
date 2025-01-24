[Back](../../README.md)

## GraphQL

### Apollo Federation

#### Schema

By default all of the types are optional and require `!` to mark that its required.

Example for defining a subgraph with two queries and a single basic type

Schema:
```graphql
extend schema @link(url: "https://specs.apollo.dev/federation/v2.7", import: ["@key"])

type Query {
  "The full list of locations presented by the Interplanetary Space Tourism department"
  locations: [Location!]!
  "The details of a specific location"
  location(id: ID!): Location
}

type Location {
  id: ID!
  "The name of the location"
  name: String!
  "A short description about the location"
  description: String!
  "The location's main photo as a URL"
  photo: String!
}
```

Resolver:
```javascript
export const resolvers = {
  Query: {
    locations: (_, __, { dataSources }) => {
      return dataSources.locationsAPI.getAllLocations();
    },
    location: (_, { id }, { dataSources }) => {
      return dataSources.locationsAPI.getLocation(id);
    },
  },
};
```

Field resolver callback arguments [docs](https://www.apollographql.com/docs/apollo-server/data/resolvers#resolver-arguments):
- parent - parent of the resolved field, or rootValue for query/mutation root
- args - arguments provided for that field
- context - shared objects, such as data sources, data loaders, auth information etc.
- info - field name, path to the field, cacheControl etc.

#### Referencing an entity

Other subgraphs can reference a type annotated with a key tag (becoming an entity).

One graph should define key fields by which entity can be resolved and add a reference resolver callback. The other graph should define a type stub with the key fields and not resolvable annotation, plus resolver for a field that provides the reference.

```graphql
type Location @key(fields: "id") {
  id: ID!
  name: String!
  description: String!
  photo: String!
}
```

```javascript
export const resolvers = {
  // ...
  Location: {
    __resolveReference: ({ id }, { dataSources }) => {
        return dataSources.api.getLocation(id);
    }
  },
};
```

```graphql
type Location @key(fields: "id", resolvable: false) {
  id: ID!
}

type Review {
  id: ID!
  comment: String
  rating: Int!
  location: Location!
}
```

```javascript
export const resolvers = {
  // ...
  Review: {
      location: ({ locationId }) => {
          return {id: locationId};
      }
  }
};
```

Reference resolver callback arguments [docs](https://www.apollographql.com/docs/apollo-server/using-federation/api/apollo-subgraph#__resolvereference):
- reference - Reference to be resolved, i.e. __typename and fields used to find instance by one of defined @key tags.
- context - shared objects, such as data sources, data loaders, auth information etc.
- info - field name, path to the field, cacheControl etc.

#### Extending an entity

Other subgraphs can extend an entity defined somewhere else, by adding some custom properties to it.

One graph should define key fields by which entity can be resolved and add a reference resolver callback. The other graph should define a type stub with the key fields plus all additional, extension fields. It should also include a resolver for all of added fields.

```graphql
type Location @key(fields: "id") {
  id: ID!
  name: String!
  description: String!
  photo: String!
}
```

```javascript
export const resolvers = {
  // ...
  Location: {
    __resolveReference: ({ id }, { dataSources }) => {
        return dataSources.api.getLocation(id);
    }
  },
};
```

```graphql
type Location @key(fields: "id") {
  id: ID!
  reviewsForLocation: [Review]!
}

type Review {
  id: ID!
  comment: String
  rating: Int!
  location: Location!
}
```

```javascript
export const resolvers = {
  // ...
  Location: {
    reviewsForLocation: ({ id }, _, { dataSources }) => {
      return dataSources.api.getReviewsForLocation(id);
    }
  }
};
```

The resolver used is a field resolver

[Back](../../README.md)
