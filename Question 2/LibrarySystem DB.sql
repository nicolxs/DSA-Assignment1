CREATE DATABASE IF NOT EXISTS LibrarySystem;

USE LibrarySystem;

CREATE TABLE LibrarySystem.users (
	userID VARCHAR(25) PRIMARY KEY,
	firstName  VARCHAR(255) NOT NULL,
	lastName   VARCHAR(255) NOT NULL,
	profile   VARCHAR(255) NOT NULL
);


CREATE TABLE LibrarySystem.books (
	isbn VARCHAR(25) PRIMARY KEY,
	title	VARCHAR(255) NOT NULL,
	author	VARCHAR(255) REFERENCES authors(authorID),
	book_location VARCHAR(255) REFERENCES locations(locationID),
	status	BOOL NOT NULL
);


CREATE TABLE LibrarySystem.authors (
	authorID INT PRIMARY KEY,
	firstName	VARCHAR(255) NOT NULL,
	Lastname	VARCHAR(255) NOT NULL
);


CREATE TABLE LibrarySystem.locations (
	locationID	INTEGER	PRIMARY KEY NOT NULL,
	floor	INTEGER	NOT NULL,
	aisle	VARCHAR(255)	NOT NULL,
	shelfID	VARCHAR(255)	NOT NULL
);

SELECT * FROM users;

SELECT * FROM locations;

SELECT * FROM books;

SELECT * FROM authors;