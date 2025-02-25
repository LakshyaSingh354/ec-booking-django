CREATE DATABASE IF NOT EXISTS advertsneak_epitome;

CREATE USER 'user'@'%' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON advertsneak_epitome.* TO 'user'@'%';
FLUSH PRIVILEGES;