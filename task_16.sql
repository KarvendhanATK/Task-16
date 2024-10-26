-- Create the Database
CREATE DATABASE TamilMoviesDB;

-- Use the Database
USE TamilMoviesDB;

-- Create Movie Table
CREATE TABLE Movie (
    movie_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    release_year INT,
    duration INT, -- in minutes
    description TEXT
);

-- Create Genre Table
CREATE TABLE Genre (
    genre_id INT AUTO_INCREMENT PRIMARY KEY,
    genre_name VARCHAR(50) UNIQUE NOT NULL
);

-- Create Movie_Genre Table (Movie and Genre)
CREATE TABLE Movie_Genre (
    movie_id INT,
    genre_id INT,
    PRIMARY KEY (movie_id, genre_id),
    FOREIGN KEY (movie_id) REFERENCES Movie(movie_id),
    FOREIGN KEY (genre_id) REFERENCES Genre(genre_id)
);

-- Create Media Table
CREATE TABLE Media (
    media_id INT AUTO_INCREMENT PRIMARY KEY,
    movie_id INT,
    media_type ENUM('Image', 'Video') NOT NULL,
    media_url VARCHAR(255),
    FOREIGN KEY (movie_id) REFERENCES Movie(movie_id)
);

-- Create User Table
CREATE TABLE User (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(100) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);

-- Create Review Table
CREATE TABLE Review (
    review_id INT AUTO_INCREMENT PRIMARY KEY,
    movie_id INT,
    user_id INT,
    rating INT CHECK (rating BETWEEN 1 AND 10),
    review_text TEXT,
    review_date DATE,
    FOREIGN KEY (movie_id) REFERENCES Movie(movie_id),
    FOREIGN KEY (user_id) REFERENCES User(user_id)
);

-- Create Artist Table
CREATE TABLE Artist (
    artist_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    birth_date DATE
);
 -- Create Skill Table
CREATE TABLE Skill (
    skill_id INT AUTO_INCREMENT PRIMARY KEY,
    skill_name VARCHAR(50) UNIQUE NOT NULL
);

-- Create Artist_Skill Table (Artist and Skill)
CREATE TABLE Artist_Skill (
    artist_id INT,
    skill_id INT,
    PRIMARY KEY (artist_id, skill_id),
    FOREIGN KEY (artist_id) REFERENCES Artist(artist_id),
    FOREIGN KEY (skill_id) REFERENCES Skill(skill_id)
);

-- Create Role Table
CREATE TABLE Role (
    role_id INT AUTO_INCREMENT PRIMARY KEY,
    role_name VARCHAR(50) UNIQUE NOT NULL
);

-- Create Movie_Artist_Role Table ( Movie, Artist, and Role)
CREATE TABLE Movie_Artist_Role (
    movie_id INT,
    artist_id INT,
    role_id INT,
    PRIMARY KEY (movie_id, artist_id, role_id),
    FOREIGN KEY (movie_id) REFERENCES Movie(movie_id),
    FOREIGN KEY (artist_id) REFERENCES Artist(artist_id),
    FOREIGN KEY (role_id) REFERENCES Role(role_id)
);

-- Inserting into Movie
INSERT INTO Movie (title, release_year, duration, description) VALUES 
('Viruman', 2022, 151, 'When a young Viruman watches his mother immolate herself, he disassociates himself from his greedy father. However, he prepares to seek justice.'),
('Master', 2021, 179, 'An alcoholic professor is enrolled to teach at a juvenile facility, unbeknownst to him. He soon clashes with a ruthless gangster, who uses the children as scapegoats for his crimes.');

-- Inserting into Genre
INSERT INTO Genre (genre_name) VALUES 
('Action'), ('Drama'), ('Thriller');

-- Linking Movie with Genre
INSERT INTO Movie_Genre (movie_id, genre_id) VALUES 
(1, 1), (1, 2), -- Viruman: Action, Drama  
(2, 1), (2, 3); -- Master: Action, Thriller

-- Inserting into Media
INSERT INTO Media (movie_id, media_type, media_url) VALUES 
(1, 'Video', 'https://www.youtube.com/watch?v=aRx4-fsJ5uE'), 
(1, 'Image', 'https://images.app.goo.gl/L9wYUhbN32bMWjkU9'),
(2, 'Video', 'https://www.imdb.com/video/vi2942812441/');

-- Inserting into User
INSERT INTO User (username, email) VALUES 
('arun_kumar', 'arunkumar9578@gmail.com'),
('deepa_raj', 'deeparaj1234@gmail.com');

-- Inserting into Review
INSERT INTO Review (movie_id, user_id, rating, review_text, review_date) VALUES 
(1, 1, 8, 'A very nice movie filled with emotion, family bond ,affection.', '2022-08-14'),
(2, 2, 9, 'Vijay was phenomenal in Master!', '2021-01-15');

-- Inserting into Artist
INSERT INTO Artist (name, birth_date) VALUES 
('Karthi', '1977-05-25'),
('Vijay', '1974-06-22'), 
('Lokesh Kanagaraj', '1986-03-14');

-- Inserting into Skill
INSERT INTO Skill (skill_name) VALUES 
('Acting'), ('Directing');

-- Linking Artist with Skill
INSERT INTO Artist_Skill (artist_id, skill_id) VALUES 
(1, 1), -- Karthi is an actor
(2, 1), -- Vijay is an actor
(3, 2); -- Lokesh Kanagaraj is a director

-- Inserting into Role
INSERT INTO Role (role_name) VALUES 
('Actor'), ('Director');

-- Linking Movie, Artist, and Role
INSERT INTO Movie_Artist_Role (movie_id, artist_id, role_id) VALUES 
(1, 1, 1), -- Karthi as Actor in Viruman
(2, 2, 1), -- Vijay as Actor in Master
(2, 3, 2); -- Lokesh Kanagaraj as Director in Master
