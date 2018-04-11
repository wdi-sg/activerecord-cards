# activerecord-cards

Continuing on from the ruby-oop-cards exercise: https://github.com/wdi-sg/ruby-oop-cards/

A set of starter code has been provided with a working card game.

1. Create a Postgres database with name `cardgame`.

1. Create a `hands` table in schema.sql

1. Inside the `hands` table, keep a record of each hand played and the user name.

1. When the game ends, print all the hands that have been played this session.

### Hints:
some relevant commands:

`$ createdb db_name`

`$ psql -d db_name < db/schema.sql`


# further

1. Store the user name in a separate `users` table.
1. When the game ends, print all the hands that have been played this session.

### Hints:
Look into setting up associations
http://guides.rubyonrails.org/association_basics.html
