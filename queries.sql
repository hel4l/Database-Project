-- Inserting sample data into Users table
INSERT INTO Users (username, email, password, join_date)
VALUES
    ('JohnDoe', 'johndoe@example.com', 'password1', '2023-01-01 08:00:00'),
    ('AliceSmith', 'alicesmith@example.com', 'password2', '2023-02-05 09:30:00'),
    ('BobJohnson', 'bobjohnson@example.com', 'password3', '2023-03-10 10:45:00'),
    ('EmilyBrown', 'emilybrown@example.com', 'password4', '2023-04-15 11:20:00'),
    ('DavidLee', 'davidlee@example.com', 'password5', '2023-05-20 12:30:00'),
    ('SarahTaylor', 'sarahtaylor@example.com', 'password6', '2023-06-25 13:45:00'),
    ('MichaelWilson', 'michaelwilson@example.com', 'password7', '2023-07-30 14:55:00'),
    ('JessicaMartinez', 'jessicamartinez@example.com', 'password8', '2023-08-05 15:10:00'),
    ('DanielAnderson', 'danielanderson@example.com', 'password9', '2023-09-10 16:20:00'),
    ('LisaThomas', 'lisathomas@example.com', 'password10', '2023-10-15 17:30:00');

-- Inserting sample data into Games table
INSERT INTO Games (title, genre, release_date, developer, platform, avg_rating)
VALUES
    ('Assassin''s Creed Valhalla', 'Action-Adventure', '2020-11-10', 'Ubisoft Montreal', 'PC', 4.5),
    ('The Last of Us Part II', 'Action-Adventure', '2020-06-19', 'Naughty Dog', 'PS4', 4.8),
    ('Cyberpunk 2077', 'Action-RPG', '2020-12-10', 'CD Projekt Red', 'PC', 3.9),
    ('Animal Crossing: New Horizons', 'Life Simulation', '2020-03-20', 'Nintendo EPD', 'Switch', 4.7),
    ('Genshin Impact', 'Action-RPG', '2020-09-28', 'miHoYo', 'Mobile', 4.6),
    ('Ghost of Tsushima', 'Action-Adventure', '2020-07-17', 'Sucker Punch Productions', 'PS4', 4.7),
    ('Among Us', 'Social Deduction', '2018-06-15', 'InnerSloth', 'Mobile', 4.5),
    ('Hades', 'Action-RPG', '2020-09-17', 'Supergiant Games', 'PC', 4.9),
    ('The Legend of Zelda: Breath of the Wild', 'Action-Adventure', '2017-03-03', 'Nintendo EPD', 'Switch', 4.9),
    ('Final Fantasy VII Remake', 'Action-RPG', '2020-04-10', 'Square Enix', 'PS4', 4.7);

-- Inserting sample data into Reviews table
INSERT INTO Reviews (user_id, game_id, rating, content, publication_date)
VALUES
    (1, 1, 4.5, 'Great game, loved the graphics!', '2023-01-02 08:30:00'),
    (2, 1, 3.8, 'Enjoyable gameplay but needs more content.', '2023-01-03 09:45:00'),
    (3, 2, 4.2, 'Compelling storyline and characters.', '2023-01-04 10:55:00'),
    (4, 2, 3.5, 'Good game overall, but controls are clunky.', '2023-01-05 11:20:00'),
    (5, 3, 4.7, 'Best strategy game I have played in a while.', '2023-01-06 12:40:00'),
    (6, 3, 4.0, 'Interesting mechanics, but a bit steep learning curve.', '2023-01-07 13:55:00'),
    (7, 4, 4.8, 'Immersive RPG experience with deep lore.', '2023-01-08 14:10:00'),
    (8, 4, 4.3, 'Fun RPG, but lacks endgame content.', '2023-01-09 15:25:00'),
    (9, 5, 3.9, 'Challenging puzzles, but too short.', '2023-01-10 16:30:00'),
    (10, 5, 4.1, 'Addictive gameplay, couldn''t put it down!', '2023-01-11 17:45:00');

-- Retrieve information about a specific user and their reviews
SELECT Users.username, Reviews.rating, Reviews.content
FROM Users
JOIN Reviews ON Users.user_id = Reviews.user_id
WHERE Users.user_id BETWEEN 1 AND 10;

-- Add a new user to the Users table
INSERT INTO Users (username, email, password, join_date)
VALUES ('newuser', 'newuser@example.com', 'password123', DATETIME('now'));

-- Change the username of a specific user
UPDATE Users
SET username = 'new_username'
WHERE user_id = 5;

-- Remove a review from the Reviews table
DELETE FROM Reviews
WHERE review_id = 7;

-- Show the top 5 games based on average ratings from the Top5Games view
SELECT *
FROM Top5Games;

-- Add a new review for a game
INSERT INTO Reviews (user_id, game_id, rating, content, publication_date)
VALUES (3, 2, 4.5, 'Great game, highly recommended!', DATETIME('now'));

-- Modify the release date of a game
UPDATE Games
SET release_date = '2023-05-15 00:00:00'
WHERE game_id = 8;

-- Delete a user and all their associated reviews
DELETE FROM Users
WHERE user_id = 9;
