DROP TABLE IF EXISTS hands;

CREATE TABLE hands(
  id SERIAL PRIMARY KEY,
  user_hand INT,
  house_hand INT,
  user_name TEXT
);
