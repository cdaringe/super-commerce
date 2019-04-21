# super-commerce

a minimal viable demo of showing how to pragmatically:

- apply row-level security policies via postgresql, and
- integrate with rls protected resources in a web application

see [cdaringe.com/protect-bacon-with-rls](https://cdaringe.com/protect-bacon-with-rls)
for a guided tour.

## usage

### prereqs

- install `docker` for running an ephemral postgres instance
- install `nodejs` for running the application server
- install `yarn` package manager to install dependencies
- consider reviewing the`src/migration/###-<name>.sql` migration sql files
    - it's worth seeing how rls is being implemented!

### run

- run `yarn` in the project root. this will:
    - purge any existing `commerce` database
    - fire up a new db
    - migrate the db
    - compile the typescript files
    - run the server application, attached to the database
- kill/purge the db - ``yarn db:container:kill`

follow the onscreen instructions for more.