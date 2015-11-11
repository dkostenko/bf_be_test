# Test task for company

## Some important steps to run this app in development environment

* Create databases in postgreSQL with commands (where DEVELOPMENT_DATABASE_NAME and TEST_DATABASE_NAME are your database names, and DATABASE_USERNAME is your postgrSQL user name):

```
CREATE DATABASE DEVELOPMENT_DATABASE_NAME OWNER=DATABASE_USERNAME;
CREATE DATABASE TEST_DATABASE_NAME OWNER=DATABASE_USERNAME;
```

* Add config/database.yml with content:

```
default: &default
  adapter: postgresql
  encoding: unicode
  pool: 5
  username: DATABASE_USERNAME
  password: DATABASE_PASSWORD
  host: localhost

development:
  <<: *default
  database: DEVELOPMENT_DATABASE_NAME

test:
  <<: *default
  database: TEST_DATABASE_NAME

production:
  <<: *default
  database: PRODUCTION_DATABASE_NAME
```

* Create config/secrets.yml with command:

```
development:
  secret_key_base: YOUR_DEVELOPMENT_SECRET_KEY

test:
  secret_key_base: YOUR_TEST_SECRET_KEY

production:
  secret_key_base: <%= ENV["SECRET_KEY_BASE"] %>
```

* Run this command to generate secret_key:

```
rake secret
```