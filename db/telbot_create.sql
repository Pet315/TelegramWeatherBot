-- DROP DATABASE Chatbot;
CREATE DATABASE IF NOT EXISTS Chatbot;
USE chatbot;

CREATE TABLE IF NOT EXISTS Message_language
(id_language INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(3)
);

CREATE TABLE IF NOT EXISTS Chat
(id_chat INT NOT NULL PRIMARY KEY,
id_language INT NOT NULL,
city VARCHAR(40),
FOREIGN KEY (id_language) REFERENCES Message_language (id_language) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Settings
(id_chat INT NOT NULL PRIMARY KEY,
humidity boolean NOT NULL,
temperature boolean NOT NULL,
feels_like_temperature boolean NOT NULL,
wind_speed boolean NOT NULL,
pressure boolean NOT NULL,
weather_description boolean NOT NULL,
FOREIGN KEY (id_chat) REFERENCES Chat (id_chat) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Subscription
(id_subscription INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
id_chat INT NOT NULL,
time_slot TIME NOT NULL,
FOREIGN KEY (id_chat) REFERENCES Chat (id_chat) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Actions
(id_action INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
action_description VARCHAR(40)
);

CREATE TABLE IF NOT EXISTS User_action
(id_chat INT NOT NULL,
id_action INT,
FOREIGN KEY (id_chat) REFERENCES Chat (id_chat) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (id_action) REFERENCES Actions (id_action) ON DELETE CASCADE ON UPDATE CASCADE
);
