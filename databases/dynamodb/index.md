[Back](../../README.md)

## Performance & costs

- Query will read up to 1 MB of data
- Cost is dependent on the number of items that DDB has to read, not how many it returns
- Filtering is applied after data page is retrieved only for that page

> DynamoDB calculates the number of read capacity units consumed based on item size, not on the amount of data that is returned to an application. The number of capacity units consumed will be the same whether you request all of the attributes (the default behavior) or just some of them (using a projection expression). The number will also be the same whether or not you use a FilterExpression.

> Every secondary index is associated with exactly one table, from which it obtains its data. This is called the base table for the index. When you create an index, you define an alternate key for the index (partition key and sort key). You also define the attributes that you want to be projected, or copied, from the base table into the index. DynamoDB copies these attributes into the index, along with the primary key attributes from the base table. You can then query or scan the index just as you would query or scan a table.

> the key values in a global secondary index do not need to be unique.

[Back](../../README.md)
