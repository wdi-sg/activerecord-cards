DROP TABLE IF EXISTS hands;

CREATE TABLE hands(
    id SERIAL PRIMARY KEY,
    session_no INT,
    username VARCHAR (255),
    user_hand INT ,
    house_hand INT
);
