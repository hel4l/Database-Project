-- Create Users table
CREATE TABLE Users (
    user_id INTEGER PRIMARY KEY,
    username TEXT NOT NULL,
    email TEXT NOT NULL,
    password TEXT NOT NULL,
    join_date DATETIME NOT NULL -- Changed to DATETIME
);

-- Create Games table
CREATE TABLE Games (
    game_id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    genre TEXT NOT NULL,
    release_date DATETIME NOT NULL, -- Changed to DATETIME
    developer TEXT NOT NULL,
    platform TEXT NOT NULL,
    avg_rating REAL DEFAULT 0 -- Added DEFAULT 0
);

-- Create Reviews table
CREATE TABLE Reviews (
    review_id INTEGER PRIMARY KEY,
    user_id INTEGER NOT NULL,
    game_id INTEGER NOT NULL,
    rating REAL NOT NULL,
    content TEXT NOT NULL,
    publication_date DATETIME NOT NULL, -- Changed to DATETIME
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (game_id) REFERENCES Games(game_id)
);
-- Create a view to show top 5 games based on average ratings
CREATE VIEW Top5Games AS
SELECT title, avg_rating
FROM Games
ORDER BY avg_rating DESC
LIMIT 5;

-- Create a view to show top genres based on the number of games
CREATE VIEW TopGenres AS
SELECT genre, COUNT(*) AS num_games
FROM Games
GROUP BY genre
ORDER BY num_games DESC;

-- Create trigger to calculate average rating after insertion of a new review
CREATE TRIGGER calculate_avg_rating
AFTER INSERT ON Reviews
FOR EACH ROW
BEGIN
    UPDATE Games
    SET avg_rating = (
        SELECT AVG(rating)
        FROM Reviews
        WHERE game_id = NEW.game_id
    )
    WHERE game_id = NEW.game_id;
END;

-- Create trigger to recalculate average rating after deletion of a review
CREATE TRIGGER recalculate_avg_rating
AFTER DELETE ON Reviews
FOR EACH ROW
BEGIN
    UPDATE Games
    SET avg_rating = (
        SELECT AVG(rating)
        FROM Reviews
        WHERE game_id = OLD.game_id
    )
    WHERE game_id = OLD.game_id;
END;

-- Indexes for faster retrieval
CREATE INDEX idx_user_id ON Reviews (user_id);
CREATE INDEX idx_game_id ON Reviews (game_id);
