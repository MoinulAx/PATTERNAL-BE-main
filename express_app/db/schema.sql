-- Drop the database if it exists
DROP DATABASE IF EXISTS patternal_dev;

-- Create the database
CREATE DATABASE patternal_dev;

-- Connect to the new database
\c patternal_dev

-- Users Table
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    child_amount INT,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    meditation_streak INT DEFAULT 0,
    meditation_status BOOLEAN DEFAULT FALSE
);


-- Journal Entries Table
-- Updated journal_entries table schema
CREATE TABLE journal_entries (
    id SERIAL PRIMARY KEY,                        
    user_id INT NOT NULL REFERENCES users(id) ON DELETE CASCADE,                   
    mood VARCHAR(5),                               
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL 
);

-- Journal Questions Table
-- Updated journal_questions table schema
CREATE TABLE journal_questions (
    id SERIAL PRIMARY KEY,                              
    entry_id INT NOT NULL REFERENCES journal_entries(id) ON DELETE CASCADE,  
    question_text TEXT NOT NULL,                        
    mood_level VARCHAR(5),                              
    answer BOOLEAN,                                      
    content_section TEXT                                
);

CREATE TABLE notes (
    id SERIAL PRIMARY KEY,                              
    entry_id INT NOT NULL REFERENCES journal_entries(id) ON DELETE CASCADE,  
    note TEXT                                
);

-- -- Journal Responses Table
-- CREATE TABLE journal_responses (
--     id SERIAL PRIMARY KEY,
--     question_id INT NOT NULL REFERENCES journal_questions(id) ON DELETE CASCADE,
--     response_text TEXT NOT NULL  -- User's response to the question
-- );

-- Meditation Sessions Table
-- CREATE TABLE meditation_sessions (
--     id SERIAL PRIMARY KEY,
--     user_id INT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
--     session_length INT NOT NULL,
--     completion_status BOOLEAN NOT NULL,
--     created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
--     CONSTRAINT unique_user_date UNIQUE (user_id, med)
-- );

-- Father Activity Logs Table
CREATE TABLE father_activity_logs (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    activity_description TEXT NOT NULL,
    reflection TEXT,
    duration INT,
    planned_activity_date TIMESTAMP,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
);

-- Resources Table
CREATE TABLE resources (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    url TEXT NOT NULL,
    resource_type VARCHAR(50),
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
);


-- Forum Categories Table
CREATE TABLE forum_categories (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    description TEXT,
    img_url VARCHAR(255)
);

-- Forum Entry Table
CREATE TABLE forum_entry (
    id SERIAL PRIMARY KEY,
    entry VARCHAR(255) NOT NULL,
    category_id INT NOT NULL REFERENCES forum_categories(id) ON DELETE CASCADE,
    user_id INT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    likes_count INT DEFAULT 0, 
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP 
 
);

-- Comments Table
CREATE TABLE comments (
    id SERIAL PRIMARY KEY,
    entry_id INT NOT NULL REFERENCES forum_entry(id) ON DELETE CASCADE,
    comment VARCHAR(255) NOT NULL,
    user_id INT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    likes_count INT DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP 
);

-- Tip of the Day Table
CREATE TABLE tip_of_day (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    img VARCHAR(255) NOT NULL,
    tip VARCHAR(255) NOT NULL,
    date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Likes Table for tracking likes on forum entries
CREATE TABLE forum_likes (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    forum_entry_id INT REFERENCES forum_entry(id) ON DELETE CASCADE,
    UNIQUE (user_id, forum_entry_id)  
);

-- Likes Table for tracking likes on comments
CREATE TABLE comments_likes (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    comment_id INT NOT NULL REFERENCES comments(id) ON DELETE CASCADE,
    UNIQUE (user_id, comment_id) 
);
