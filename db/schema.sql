DROP TABLE IF EXISTS hands;
DROP TABLE IF EXISTS users;

CREATE TABLE hands(
	id SERIAL PRIMARY KEY,
	hand_result TEXT,
	hand_no Integer,
	user_id Integer
);

CREATE TABLE users(
	id SERIAL PRIMARY KEY,
	username TEXT
);
