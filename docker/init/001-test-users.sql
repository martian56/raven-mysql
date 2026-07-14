ALTER USER 'raven'@'%' IDENTIFIED WITH mysql_native_password BY 'ravenpw';
GRANT ALL PRIVILEGES ON ravendb.* TO 'raven'@'%';

CREATE USER 'raven_empty'@'%' IDENTIFIED WITH mysql_native_password BY '';
GRANT ALL PRIVILEGES ON ravendb.* TO 'raven_empty'@'%';

