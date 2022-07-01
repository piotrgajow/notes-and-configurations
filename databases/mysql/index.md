[Back](../../README.md)

## User management

| Command                                                             | Description                                               |
|:--------------------------------------------------------------------|:----------------------------------------------------------|
| `CREATE USER '<USER>'@'<HOST>'`                                     | Create passwordless user                                  |
| `CREATE USER '<USER>'@'<HOST>' IDENTIFIED BY '<PASSWORD>'`          | Create user with password given by text                   |
| `CREATE USER '<USER>'@'<HOST>' IDENTIFIED BY PASSWORD '<PASSWORD>'` | Create user with password given by hash                   |
| `GRANT <PRIVILEGE> ON <OBJECT_TYPE + OBJECT> TO '<USER>'@'<HOST>'`  | Grant user access to given resource (database, table etc) |

## Configuration

[Basic my.cnf config file](./my.cnf)


[Back](../../README.md)
