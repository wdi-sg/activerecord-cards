DROP TABLE IF EXISTS hands;

CREATE TABLE hands(
  id SERIAL PRIMARY KEY,
  user_hand INT,
  house_hand INT,
  user_id INT
);

CREATE TABLE users(
  id SERIAL PRIMARY KEY,
  user_name TEXT
);
