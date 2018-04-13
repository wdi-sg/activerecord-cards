DROP TABLE IF EXISTS hands;
DROP TABLE IF EXISTS users;

CREATE TABLE hands(
  id SERIAL PRIMARY KEY,
  played_hand TEXT,
  user_id INT
);

CREATE TABLE users(
  id SERIAL PRIMARY KEY,
  name TEXT
);
