DROP TABLE IF EXISTS hands;

CREATE TABLE hands
(
    id SERIAL PRIMARY KEY,
    card TEXT,
    users_id INT
);

DROP TABLE IF EXISTS users;

CREATE TABLE users
(
    id SERIAL PRIMARY KEY,
    name TEXT
);
