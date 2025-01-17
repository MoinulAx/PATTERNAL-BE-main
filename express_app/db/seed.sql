\c patternal_dev;


-- Seed Data for Users
INSERT INTO users (username, first_name, last_name, email, password, child_amount, created_at, updated_at) VALUES
('dadlife_jack', 'Jack', 'Doe', 'jack_doe_unique@example.com', 'hashed_password1', 2, now(), now()),
('chrisbuilder', 'Chris', 'Smith', 'chris_smith_unique@example.com', 'hashed_password2', 1, now(), now()),
('bradbacon', 'Brad', 'Johnson', 'brad_johnson_unique@example.com', 'hashed_password3', 6, now(), now()),
('grillmike', 'Mike', 'Thompson', 'mike_thompson_unique@example.com', 'hashed_password4', 3, now(), now()),
('jasonjuggler', 'Jason', 'Williams', 'jason_williams_unique@example.com', 'hashed_password5', 2, now(), now()),
('davetheway', 'David', 'Brown', 'david_brown_unique@example.com', 'hashed_password6', 1, now(), now()), 
('Milo', 'Milo', 'P', 'milo', '123', 1, '2024-01-01 12:00:00', '2024-01-01 12:00:00'), 
('VnlTest', 'V', 'D', 'vnl', '123', 4, '2024-01-01 12:00:00', '2024-01-01 12:00:00'),
('BoB4Christ', 'Craig', 'Unga', 'craig_unga@example.com', '123', 5, '2024-01-01 12:00:00', '2024-01-01 12:00:00'),
('AlexDadLyfe', 'Alex', 'Johnson', 'alex@gmail.com', '123', 1, now(), now());



-- Seed Data for Journal Entries (3 entries per user)
INSERT INTO journal_entries (user_id, mood, created_at) VALUES
-- Entries for user 1
(1, '5', '2024-01-15 07:30:00'),
(1, '3', '2024-01-16 08:00:00'),
(1, '4', '2024-01-17 09:00:00'),
(1, '2', '2024-01-18 10:00:00'),   
(1, '5', '2024-01-19 11:00:00'),   
(1, '3', '2024-01-20 12:00:00'),   
(1, '4', '2024-01-21 13:00:00'),   
(1, '5', '2024-01-22 14:00:00'),   
(1, '2', '2024-01-23 15:00:00'),   

-- Entries for user 2
(2, '2', '2024-03-10 23:55:00'),
(2, '4', '2024-03-11 10:00:00'),
(2, '5', '2024-03-12 15:30:00'),
(2, '3', '2024-03-13 12:00:00'),   
(2, '1', '2024-03-14 13:30:00'),   
(2, '5', '2024-03-15 14:00:00'),   
(2, '2', '2024-03-16 15:30:00'),   
(2, '4', '2024-03-17 16:00:00'),   
(2, '3', '2024-03-18 17:30:00'),   

-- Entries for user 3
(3, '4', '2024-04-11 09:15:00'),
(3, '3', '2024-04-12 14:00:00'),
(3, '5', '2024-04-13 18:45:00'),
(3, '2', '2024-04-14 14:30:00'),   
(3, '4', '2024-04-15 15:00:00'),   
(3, '5', '2024-04-16 16:30:00'),   
(3, '3', '2024-04-17 17:00:00'),   
(3, '2', '2024-04-18 18:00:00'),   
(3, '4', '2024-04-19 19:15:00'),   

-- Entries for user 4
(4, '5', '2024-06-03 18:00:00'),
(4, '4', '2024-06-04 07:45:00'),
(4, '2', '2024-06-05 16:20:00'),
(4, '3', '2024-06-06 16:45:00'),   
(4, '5', '2024-06-07 17:15:00'),   
(4, '4', '2024-06-08 18:30:00'),   
(4, '2', '2024-06-09 19:15:00'),   
(4, '3', '2024-06-10 20:30:00'),   
(4, '5', '2024-06-11 21:45:00'),   

-- Entries for user 5
(5, '3', '2024-07-25 13:00:00'),
(5, '2', '2024-07-26 09:30:00'),
(5, '4', '2024-07-27 20:00:00'),
(5, '5', '2024-07-28 18:00:00'),   
(5, '3', '2024-07-29 19:30:00'),   
(5, '4', '2024-07-30 20:45:00'),   
(5, '5', '2024-07-31 21:30:00'),   
(5, '2', '2024-08-01 22:15:00'),   
(5, '3', '2024-08-02 23:00:00'),   

-- Entries for user 6
(6, '4', '2024-08-01 17:00:00'),
(6, '5', '2024-08-02 11:15:00'),
(6, '3', '2024-08-03 22:00:00'),
(6, '2', '2024-08-04 20:15:00'),   
(6, '4', '2024-08-05 21:00:00'),   
(6, '5', '2024-08-06 22:30:00'),   
(6, '3', '2024-08-07 23:15:00'),   
(6, '2', '2024-08-08 23:45:00'),   
(6, '4', '2024-08-09 23:30:00'),   

-- Entries for user 7
(7, '3', '2024-09-10 12:30:00'),
(7, '4', '2024-09-11 14:00:00'),
(7, '5', '2024-09-12 18:00:00'),
(7, '5', '2024-09-13 22:00:00'),   
(7, '2', '2024-09-14 23:00:00'),   
(7, '3', '2024-09-15 20:00:00'),   
(7, '4', '2024-09-16 21:00:00'),   
(7, '5', '2024-09-17 22:00:00'),   
(7, '2', '2024-09-18 21:45:00'),   

-- Entries for user 8
(8, '5', '2024-10-01 09:00:00'),
(8, '4', '2024-10-02 16:00:00'),
(8, '3', '2024-10-03 20:30:00'),
(8, '3', '2024-10-04 10:15:00'),   
(8, '5', '2024-10-05 11:30:00'),   
(8, '4', '2024-10-06 12:15:00'),   
(8, '3', '2024-10-07 13:00:00'),   
(8, '5', '2024-10-08 14:30:00'),   
(8, '2', '2024-10-09 15:45:00'),   

-- Entries for user 9
(9, '4', '2024-10-15 08:45:00'),
(9, '5', '2024-10-16 13:00:00'),
(9, '3', '2024-10-17 19:30:00'),
(9, '2', '2024-10-18 12:15:00'),   
(9, '4', '2024-10-19 13:30:00'),   
(9, '5', '2024-10-20 14:00:00'),   
(9, '3', '2024-10-21 15:30:00'),   
(9, '2', '2024-10-22 16:15:00'),   
(9, '4', '2024-10-23 17:30:00'),

--Alex Johnson entries
(10, '4', '2024-01-15 07:30:00'),
(10, '3', '2024-01-16 08:00:00'),
(10, '5', '2024-01-17 09:15:00'),
(10, '2', '2024-01-18 06:45:00'),
(10, '4', '2024-01-19 10:30:00'),
(10, '1', '2024-01-20 07:00:00'),
(10, '3', '2024-01-21 08:20:00'),
(10, '5', '2024-01-22 09:05:00'),
(10, '4', '2024-01-23 06:50:00'),
(10, '2', '2024-01-24 07:45:00');



-- Seed data for journal_questions table for user 1, matching mood_level with the journal_entries
INSERT INTO journal_questions (entry_id, question_text, mood_level, answer, content_section)
VALUES
-- Entry 1 (Mood: 5)
(1, 'How do you feel about your day?', '5', true, 'Reflection'),
(1, 'Did you accomplish your goals?', '5', true, 'Daily Goals'),
(1, 'What was the highlight of your day?', '5', true, 'Positive Moments'),

-- Entry 2 (Mood: 3)
(2, 'What challenged you today?', '3', false, 'Challenges'),
(2, 'Did you take time to relax?', '3', true, 'Self-care'),
(2, 'Were you able to stay focused?', '3', false, 'Productivity'),

-- Entry 3 (Mood: 4)
(3, 'How was your overall mood?', '4', true, 'Emotional Reflection'),
(3, 'Did you connect with others?', '4', true, 'Social Interaction'),
(3, 'Were you satisfied with your work?', '4', true, 'Productivity'),

-- Entry 4 (Mood: 2)
(4, 'What caused you stress today?', '2', false, 'Challenges'),
(4, 'Did you manage to relax?', '2', false, 'Self-care'),
(4, 'What could you improve tomorrow?', '2', false, 'Reflection'),

-- Entry 5 (Mood: 5)
(5, 'What made you happy today?', '5', true, 'Positive Moments'),
(5, 'Did you achieve personal goals?', '5', true, 'Daily Goals'),
(5, 'What made you proud?', '5', true, 'Achievements'),

-- Entry 6 (Mood: 3)
(6, 'Were you able to manage your time well?', '3', false, 'Time Management'),
(6, 'Did you handle your tasks efficiently?', '3', false, 'Productivity'),
(6, 'What made your day challenging?', '3', false, 'Challenges'),

-- Entry 7 (Mood: 4)
(7, 'How did you feel overall today?', '4', true, 'Reflection'),
(7, 'Did you find time for yourself?', '4', true, 'Self-care'),
(7, 'What could make tomorrow better?', '4', true, 'Improvement'),

-- Entry 8 (Mood: 5)
(8, 'What was the best part of your day?', '5', true, 'Positive Moments'),
(8, 'Did you spend time with loved ones?', '5', true, 'Social Interaction'),
(8, 'Did you complete all your tasks?', '5', true, 'Productivity'),

-- Entry 9 (Mood: 2)
(9, 'What caused frustration today?', '2', false, 'Challenges'),
(9, 'Did you find ways to relax?', '2', false, 'Self-care'),
(9, 'How can you improve your mood tomorrow?', '2', false, 'Reflection'),

-- Entry 10 (Mood: 2)
(10, 'What stressed you out today?', '2', false, 'Challenges'),
(10, 'Did you take time for yourself?', '2', false, 'Self-care'),
(10, 'How will you approach tomorrow differently?', '2', false, 'Reflection'),

-- Entry 11 (Mood: 4)
(11, 'How did you feel about your accomplishments today?', '4', true, 'Productivity'),
(11, 'Did you connect with others?', '4', true, 'Social Interaction'),
(11, 'Were you able to stay positive?', '4', true, 'Mindset'),

-- Entry 12 (Mood: 5)
(12, 'What made you happiest today?', '5', true, 'Positive Moments'),
(12, 'Did you achieve everything you planned?', '5', true, 'Daily Goals'),
(12, 'Were you able to unwind after work?', '5', true, 'Relaxation'),

-- Entry 13 (Mood: 3)
(13, 'What did you struggle with today?', '3', false, 'Challenges'),
(13, 'Did you manage to focus on your tasks?', '3', false, 'Productivity'),
(13, 'How was your interaction with others?', '3', false, 'Social Interaction'),

-- Entry 14 (Mood: 1)
(14, 'What made today difficult?', '1', false, 'Challenges'),
(14, 'Did you feel overwhelmed?', '1', false, 'Stress'),
(14, 'What can you do to improve tomorrow?', '1', false, 'Reflection'),

-- Entry 15 (Mood: 5)
(15, 'What was the highlight of your day?', '5', true, 'Positive Moments'),
(15, 'Did you enjoy some downtime?', '5', true, 'Self-care'),
(15, 'Were you satisfied with your work?', '5', true, 'Productivity'),

-- Entry 16 (Mood: 2)
(16, 'What caused stress today?', '2', false, 'Challenges'),
(16, 'Were you able to take breaks?', '2', false, 'Work-Life Balance'),
(16, 'How can you improve your routine?', '2', false, 'Improvement'),

-- Entry 17 (Mood: 4)
(17, 'How did your day go overall?', '4', true, 'Reflection'),
(17, 'Did you have positive interactions?', '4', true, 'Social Interaction'),
(17, 'Were you able to manage your time effectively?', '4', true, 'Productivity'),

-- Entry 18 (Mood: 3)
(18, 'What challenges did you face today?', '3', false, 'Challenges'),
(18, 'Did you meet your goals?', '3', false, 'Productivity'),
(18, 'How was your emotional state?', '3', false, 'Reflection'),

-- Seed data for journal_questions table for user 3

-- Entry 19 (Mood: 4)
(19, 'How do you feel about today?', '4', true, 'Reflection'),
(19, 'Did you accomplish your tasks?', '4', true, 'Productivity'),
(19, 'What was the best part of your day?', '4', true, 'Positive Moments'),

-- Entry 20 (Mood: 3)
(20, 'What was the most challenging task today?', '3', false, 'Challenges'),
(20, 'Did you manage your time well?', '3', false, 'Time Management'),
(20, 'Were you able to focus on your work?', '3', false, 'Productivity'),

-- Entry 21 (Mood: 5)
(21, 'What made today enjoyable?', '5', true, 'Positive Moments'),
(21, 'Did you feel content?', '5', true, 'Reflection'),
(21, 'What did you achieve today?', '5', true, 'Productivity'),

-- Entry 22 (Mood: 2)
(22, 'What caused you to feel low today?', '2', false, 'Emotional Reflection'),
(22, 'Did you feel stressed?', '2', false, 'Stress'),
(22, 'What can you do to feel better tomorrow?', '2', false, 'Self-care'),

-- Entry 23 (Mood: 4)
(23, 'What were your achievements today?', '4', true, 'Achievements'),
(23, 'Did you feel in control of your tasks?', '4', true, 'Productivity'),
(23, 'What made you happy today?', '4', true, 'Positive Moments'),

-- Entry 24 (Mood: 5)
(24, 'What are you most proud of today?', '5', true, 'Pride'),
(24, 'Did you connect with loved ones?', '5', true, 'Social Interaction'),
(24, 'How did you take care of yourself today?', '5', true, 'Self-care'),

-- Entry 25 (Mood: 3)
(25, 'What challenges did you overcome?', '3', false, 'Challenges'),
(25, 'Did you manage to stay productive?', '3', false, 'Productivity'),
(25, 'How did you handle stress?', '3', false, 'Stress Management'),

-- Entry 26 (Mood: 2)
(26, 'What caused you to feel low today?', '2', false, 'Challenges'),
(26, 'Were you able to relax?', '2', false, 'Self-care'),
(26, 'What steps can you take to improve tomorrow?', '2', false, 'Reflection'),

-- Entry 27 (Mood: 4)
(27, 'How do you feel about your day?', '4', true, 'Reflection'),
(27, 'What did you enjoy most?', '4', true, 'Positive Moments'),
(27, 'Were you able to achieve your goals?', '4', true, 'Productivity'),

-- Seed data for journal_questions table for user 4

-- Entry 28 (Mood: 5)
(28, 'What brought you joy today?', '5', true, 'Positive Moments'),
(28, 'Did you achieve your goals?', '5', true, 'Productivity'),
(28, 'How did you unwind?', '5', true, 'Relaxation'),

-- Entry 29 (Mood: 4)
(29, 'What went well for you today?', '4', true, 'Achievements'),
(29, 'Did you feel productive?', '4', true, 'Productivity'),
(29, 'How did you manage your time?', '4', true, 'Time Management'),

-- Entry 30 (Mood: 2)
(30, 'What challenges did you face today?', '2', false, 'Challenges'),
(30, 'Did you feel stressed?', '2', false, 'Stress'),
(30, 'What can you do differently tomorrow?', '2', false, 'Reflection'),

-- Entry 31 (Mood: 3)
(31, 'What were the highlights of your day?', '3', false, 'Reflection'),
(31, 'Did you manage to stay focused?', '3', false, 'Productivity'),
(31, 'How was your interaction with others?', '3', false, 'Social Interaction'),

-- Entry 32 (Mood: 5)
(32, 'What made you happiest today?', '5', true, 'Positive Moments'),
(32, 'Did you achieve your personal goals?', '5', true, 'Achievements'),
(32, 'How did you spend your downtime?', '5', true, 'Self-care'),

-- Entry 33 (Mood: 4)
(33, 'What did you accomplish today?', '4', true, 'Productivity'),
(33, 'Did you feel satisfied with your work?', '4', true, 'Reflection'),
(33, 'What motivated you today?', '4', true, 'Inspiration'),

-- Entry 34 (Mood: 2)
(34, 'What caused you to feel down?', '2', false, 'Emotional Reflection'),
(34, 'Were you able to cope with stress?', '2', false, 'Stress Management'),
(34, 'What can you improve for tomorrow?', '2', false, 'Reflection'),

-- Entry 35 (Mood: 3)
(35, 'What did you learn from today?', '3', false, 'Reflection'),
(35, 'Did you struggle with any tasks?', '3', false, 'Challenges'),
(35, 'Were you able to meet your deadlines?', '3', false, 'Productivity'),

-- Entry 36 (Mood: 5)
(36, 'What are you most grateful for today?', '5', true, 'Gratitude'),
(36, 'Did you feel content with your progress?', '5', true, 'Reflection'),
(36, 'How did you maintain a positive attitude?', '5', true, 'Mindset'),

-- Seed data for journal_questions table for user 5
-- Entry 37 (Mood: 3)
(37, 'What challenges did you encounter today?', '3', false, 'Challenges'),
(37, 'Did you stay focused on your tasks?', '3', false, 'Productivity'),
(37, 'How was your mood throughout the day?', '3', false, 'Emotional State'),

-- Entry 38 (Mood: 2)
(38, 'What made today difficult?', '2', false, 'Challenges'),
(38, 'Did you take breaks when needed?', '2', false, 'Self-care'),
(38, 'What can you do to improve tomorrow?', '2', false, 'Reflection'),

-- Entry 39 (Mood: 4)
(39, 'What did you accomplish today?', '4', true, 'Achievements'),
(39, 'How was your energy level?', '4', true, 'Well-being'),
(39, 'Did you feel satisfied with your progress?', '4', true, 'Reflection'),

-- Entry 40 (Mood: 5)
(40, 'What was the best part of your day?', '5', true, 'Positive Moments'),
(40, 'Were you able to relax?', '5', true, 'Self-care'),
(40, 'Did you accomplish all your tasks?', '5', true, 'Productivity'),

-- Entry 41 (Mood: 3)
(41, 'What challenges did you face today?', '3', false, 'Challenges'),
(41, 'Were you able to focus on your work?', '3', false, 'Productivity'),
(41, 'How do you feel about today?', '3', false, 'Reflection'),

-- Entry 42 (Mood: 4)
(42, 'What went well for you today?', '4', true, 'Achievements'),
(42, 'How was your interaction with others?', '4', true, 'Social Interaction'),
(42, 'Did you meet your goals?', '4', true, 'Productivity'),

-- Entry 43 (Mood: 5)
(43, 'What are you most proud of today?', '5', true, 'Gratitude'),
(43, 'How did you relax after work?', '5', true, 'Relaxation'),
(43, 'Did you enjoy your day?', '5', true, 'Reflection'),

-- Entry 44 (Mood: 2)
(44, 'What made today difficult?', '2', false, 'Challenges'),
(44, 'Were you able to handle stress?', '2', false, 'Stress Management'),
(44, 'What will you do to make tomorrow better?', '2', false, 'Reflection'),

-- Entry 45 (Mood: 3)
(45, 'What challenges did you face today?', '3', false, 'Challenges'),
(45, 'Did you stay focused throughout the day?', '3', false, 'Productivity'),
(45, 'How do you feel about your progress?', '3', false, 'Reflection'),


-- Seed data for journal_questions table for user 6

-- Entry 46 (Mood: 4)
(46, 'What did you achieve today?', '4', true, 'Achievements'),
(46, 'How did you manage your time?', '4', true, 'Time Management'),
(46, 'Did you feel satisfied with your progress?', '4', true, 'Reflection'),

-- Entry 47 (Mood: 5)
(47, 'What made today a great day?', '5', true, 'Positive Moments'),
(47, 'Did you enjoy some downtime?', '5', true, 'Relaxation'),
(47, 'Were you able to complete all your tasks?', '5', true, 'Productivity'),

-- Entry 48 (Mood: 3)
(48, 'What challenges did you face today?', '3', false, 'Challenges'),
(48, 'Were you able to stay productive?', '3', false, 'Productivity'),
(48, 'How was your mood throughout the day?', '3', false, 'Emotional State'),

-- Entry 49 (Mood: 2)
(49, 'What made today difficult?', '2', false, 'Challenges'),
(49, 'Did you feel overwhelmed?', '2', false, 'Stress'),
(49, 'What can you do differently tomorrow?', '2', false, 'Reflection'),

-- Entry 50 (Mood: 4)
(50, 'What went well for you today?', '4', true, 'Achievements'),
(50, 'Did you feel in control of your tasks?', '4', true, 'Productivity'),
(50, 'What motivated you today?', '4', true, 'Inspiration'),

-- Entry 51 (Mood: 5)
(51, 'What was the best part of your day?', '5', true, 'Positive Moments'),
(51, 'Did you enjoy your time with loved ones?', '5', true, 'Social Interaction'),
(51, 'How did you relax after work?', '5', true, 'Self-care'),

-- Entry 52 (Mood: 3)
(52, 'What challenges did you face today?', '3', false, 'Challenges'),
(52, 'Did you stay focused on your goals?', '3', false, 'Productivity'),
(52, 'How was your emotional state?', '3', false, 'Reflection'),

-- Entry 53 (Mood: 2)
(53, 'What caused stress today?', '2', false, 'Challenges'),
(53, 'Were you able to take breaks?', '2', false, 'Work-Life Balance'),
(53, 'How can you improve your routine?', '2', false, 'Improvement'),

-- Entry 54 (Mood: 4)
(54, 'How did your day go overall?', '4', true, 'Reflection'),
(54, 'Did you have positive interactions?', '4', true, 'Social Interaction'),
(54, 'Were you able to manage your time effectively?', '4', true, 'Productivity'),

-- Seed data for journal_questions table for user 7

-- Entry 55 (Mood: 3)
(55, 'What challenges did you face today?', '3', false, 'Challenges'),
(55, 'Did you stay productive throughout the day?', '3', false, 'Productivity'),
(55, 'How do you feel about today overall?', '3', false, 'Reflection'),

-- Entry 56 (Mood: 4)
(56, 'What did you accomplish today?', '4', true, 'Achievements'),
(56, 'How did you manage your time?', '4', true, 'Time Management'),
(56, 'Did you feel satisfied with your work?', '4', true, 'Reflection'),

-- Entry 57 (Mood: 5)
(57, 'What made today a great day?', '5', true, 'Positive Moments'),
(57, 'Were you able to relax after work?', '5', true, 'Self-care'),
(57, 'Did you accomplish all of your tasks?', '5', true, 'Productivity'),

-- Entry 58 (Mood: 5)
(58, 'What was the highlight of your day?', '5', true, 'Positive Moments'),
(58, 'How did you spend your free time?', '5', true, 'Self-care'),
(58, 'Did you enjoy your day?', '5', true, 'Reflection'),

-- Entry 59 (Mood: 2)
(59, 'What made today difficult?', '2', false, 'Challenges'),
(59, 'Were you able to cope with stress?', '2', false, 'Stress Management'),
(59, 'What can you do differently tomorrow?', '2', false, 'Reflection'),

-- Entry 60 (Mood: 3)
(60, 'What challenges did you face today?', '3', false, 'Challenges'),
(60, 'Did you stay focused on your tasks?', '3', false, 'Productivity'),
(60, 'How do you feel about your progress?', '3', false, 'Reflection'),

-- Entry 61 (Mood: 4)
(61, 'What went well for you today?', '4', true, 'Achievements'),
(61, 'Did you accomplish all your goals?', '4', true, 'Productivity'),
(61, 'How was your energy throughout the day?', '4', true, 'Well-being'),

-- Entry 62 (Mood: 5)
(62, 'What made today enjoyable?', '5', true, 'Positive Moments'),
(62, 'How did you relax?', '5', true, 'Self-care'),
(62, 'Were you satisfied with your productivity?', '5', true, 'Productivity'),

-- Entry 63 (Mood: 2)
(63, 'What challenges did you face today?', '2', false, 'Challenges'),
(63, 'Did you feel overwhelmed?', '2', false, 'Stress'),
(63, 'What steps can you take to improve tomorrow?', '2', false, 'Reflection'),

-- Seed data for journal_questions table for user 8

-- Entry 64 (Mood: 5)
(64, 'What was the best part of your day?', '5', true, 'Positive Moments'),
(64, 'How did you unwind after work?', '5', true, 'Relaxation'),
(64, 'Did you accomplish your tasks?', '5', true, 'Productivity'),

-- Entry 65 (Mood: 4)
(65, 'What did you achieve today?', '4', true, 'Achievements'),
(65, 'Did you feel satisfied with your progress?', '4', true, 'Reflection'),
(65, 'What motivated you today?', '4', true, 'Inspiration'),

-- Entry 66 (Mood: 3)
(66, 'What challenges did you face today?', '3', false, 'Challenges'),
(66, 'Were you able to stay productive?', '3', false, 'Productivity'),
(66, 'How do you feel about today?', '3', false, 'Reflection'),

-- Entry 67 (Mood: 3)
(67, 'What obstacles did you encounter today?', '3', false, 'Challenges'),
(67, 'Did you feel motivated?', '3', false, 'Inspiration'),
(67, 'How was your energy throughout the day?', '3', false, 'Well-being'),

-- Entry 68 (Mood: 5)
(68, 'What made today great?', '5', true, 'Positive Moments'),
(68, 'Were you able to enjoy some downtime?', '5', true, 'Self-care'),
(68, 'How satisfied are you with your progress?', '5', true, 'Reflection'),

-- Entry 69 (Mood: 4)
(69, 'What did you accomplish today?', '4', true, 'Achievements'),
(69, 'How did you manage your time?', '4', true, 'Time Management'),
(69, 'Did you meet your goals for the day?', '4', true, 'Productivity'),

-- Entry 70 (Mood: 3)
(70, 'What challenges did you face today?', '3', false, 'Challenges'),
(70, 'Did you feel focused on your tasks?', '3', false, 'Productivity'),
(70, 'How do you feel about your day overall?', '3', false, 'Reflection'),

-- Entry 71 (Mood: 5)
(71, 'What was the highlight of your day?', '5', true, 'Positive Moments'),
(71, 'How did you relax?', '5', true, 'Self-care'),
(71, 'Did you accomplish your goals?', '5', true, 'Achievements'),

-- Entry 72 (Mood: 2)
(72, 'What made today difficult?', '2', false, 'Challenges'),
(72, 'Did you feel overwhelmed by stress?', '2', false, 'Stress'),
(72, 'What can you improve tomorrow?', '2', false, 'Reflection'),

-- Seed data for journal_questions table for user 9
-- Entry 73 (Mood: 4)
(73, 'What did you achieve today?', '4', true, 'Achievements'),
(73, 'How did you manage your time?', '4', true, 'Time Management'),
(73, 'Did you feel satisfied with your progress?', '4', true, 'Reflection'),

-- Entry 74 (Mood: 5)
(74, 'What made today a great day?', '5', true, 'Positive Moments'),
(74, 'Were you able to relax after work?', '5', true, 'Self-care'),
(74, 'Did you complete all of your tasks?', '5', true, 'Productivity'),

-- Entry 75 (Mood: 3)
(75, 'What challenges did you face today?', '3', false, 'Challenges'),
(75, 'Did you stay productive?', '3', false, 'Productivity'),
(75, 'How was your mood throughout the day?', '3', false, 'Emotional State'),

-- Entry 76 (Mood: 2)
(76, 'What made today difficult?', '2', false, 'Challenges'),
(76, 'Did you feel stressed?', '2', false, 'Stress Management'),
(76, 'What can you do differently tomorrow?', '2', false, 'Reflection'),

-- Entry 77 (Mood: 4)
(77, 'What went well today?', '4', true, 'Achievements'),
(77, 'Did you feel productive?', '4', true, 'Productivity'),
(77, 'How did you manage your time?', '4', true, 'Time Management'),

-- Entry 78 (Mood: 5)
(78, 'What made today enjoyable?', '5', true, 'Positive Moments'),
(78, 'How did you relax after work?', '5', true, 'Self-care'),
(78, 'Were you satisfied with your productivity?', '5', true, 'Reflection'),

-- Entry 79 (Mood: 3)
(79, 'What challenges did you face today?', '3', false, 'Challenges'),
(79, 'Were you able to focus?', '3', false, 'Productivity'),
(79, 'How do you feel about today?', '3', false, 'Reflection'),

-- Entry 80 (Mood: 2)
(80, 'What caused stress today?', '2', false, 'Challenges'),
(80, 'Did you feel overwhelmed?', '2', false, 'Stress Management'),
(80, 'What steps can you take to improve tomorrow?', '2', false, 'Reflection'),

-- Entry 81 (Mood: 4)
(81, 'What did you achieve today?', '4', true, 'Achievements'),
(81, 'Did you feel motivated?', '4', true, 'Inspiration'),
(81, 'How did you manage your time?', '4', true, 'Time Management'),


--alex johnson


-- Questions for entry 82
(82, 'How do you feel about your day?', '4', true, 'Daily Check-in'),
(82, 'Did you accomplish your goals?', '4', true, 'Daily Check-in'),
(82, 'What was the highlight of your day?', '4', true, 'Daily Check-in'),

-- Questions for entry 83
(83, 'How do you feel about your day?', '3', true, 'Daily Check-in'),
(83, 'Did you accomplish your goals?', '3', true, 'Daily Check-in'),
(83, 'What was the highlight of your day?', '3', true, 'Daily Check-in'),

-- Questions for entry 84
(84, 'How do you feel about your day?', '5', true, 'Daily Check-in'),
(84, 'Did you accomplish your goals?', '5', true, 'Daily Check-in'),
(84, 'What was the highlight of your day?', '5', true, 'Daily Check-in'),

-- Questions for entry 85
(85, 'How do you feel about your day?', '2', true, 'Daily Check-in'),
(85, 'Did you accomplish your goals?', '2', true, 'Daily Check-in'),
(85, 'What was the highlight of your day?', '2', true, 'Daily Check-in'),

-- Questions for entry 86
(86, 'How do you feel about your day?', '4', true, 'Daily Check-in'),
(86, 'Did you accomplish your goals?', '4', true, 'Daily Check-in'),
(86, 'What was the highlight of your day?', '4', true, 'Daily Check-in'),

-- Questions for entry 87
(87, 'How do you feel about your day?', '1', true, 'Daily Check-in'),
(87, 'Did you accomplish your goals?', '1', true, 'Daily Check-in'),
(87, 'What was the highlight of your day?', '1', true, 'Daily Check-in'),

-- Questions for entry 88
(88, 'How do you feel about your day?', '3', true, 'Daily Check-in'),
(88, 'Did you accomplish your goals?', '3', true, 'Daily Check-in'),
(88, 'What was the highlight of your day?', '3', true, 'Daily Check-in'),

-- Questions for entry 89
(89, 'How do you feel about your day?', '5', true, 'Daily Check-in'),
(89, 'Did you accomplish your goals?', '5', true, 'Daily Check-in'),
(89, 'What was the highlight of your day?', '5', true, 'Daily Check-in'),

-- Questions for entry 90
(90, 'How do you feel about your day?', '4', true, 'Daily Check-in'),
(90, 'Did you accomplish your goals?', '4', true, 'Daily Check-in'),
(90, 'What was the highlight of your day?', '4', true, 'Daily Check-in'),

-- Questions for entry 91
(91, 'How do you feel about your day?', '2', true, 'Daily Check-in'),
(91, 'Did you accomplish your goals?', '2', true, 'Daily Check-in'),
(91, 'What was the highlight of your day?', '2', true, 'Daily Check-in');



















-- Seed Data for Notes (5 notes per journal entry)
INSERT INTO notes (entry_id, note) VALUES
-- Notes for journal entries of user 1
(1, 'Need to keep up with the morning run routine.'),
(1, 'Feeling productive after today’s tasks.'),
(1, 'A bit stressed but manageable.'),
(1, 'The weather was perfect today for a walk.'),
(1, 'Excited for the weekend plans!'),

(2, 'This new project seems promising, I feel optimistic.'),
(2, 'Had a great discussion with the team.'),
(2, 'Learning new things each day.'),
(2, 'Need to focus on time management.'),
(2, 'Feeling more organized lately.'),

(3, 'Need to figure out why I couldn’t sleep last night.'),
(3, 'Feeling a little overwhelmed.'),
(3, 'Trying to find a better work-life balance.'),
(3, 'Looking into meditation for stress relief.'),
(3, 'Maybe I should take more breaks during the day.'),

-- Notes for journal entries of user 2
(4, 'Yoga is really helping me focus.'),
(4, 'I feel relaxed after today’s session.'),
(4, 'Starting to feel more in control of things.'),
(4, 'I’m getting better at handling stress.'),
(4, 'Need to continue with this routine.'),

(5, 'The kids had a fun day at school.'),
(5, 'Helped my daughter with her homework.'),
(5, 'Busy but fulfilling day.'),
(5, 'Had a meaningful conversation with my son.'),
(5, 'We should plan more family activities.'),

(6, 'Looking forward to the weekend with the family.'),
(6, 'Had a busy workday but still made time for family.'),
(6, 'I’m trying to improve my work-life balance.'),
(6, 'It’s hard to find time for myself, but I’m managing.'),
(6, 'Family time always recharges me.'),


-- Notes for journal entries of user 3
(7, 'Focused on career development today.'),
(7, 'Made progress on my personal goals.'),
(7, 'Started reading a new book.'),
(7, 'Had a productive meeting.'),
(7, 'Taking steps to improve my health.'),

(8, 'Feeling a bit sluggish today.'),
(8, 'I should take a break and recharge.'),
(8, 'Work has been overwhelming recently.'),
(8, 'Started practicing mindfulness to handle stress.'),
(8, 'Need to improve my time management.'),

(9, 'Feeling really accomplished today.'),
(9, 'Finished a major project at work.'),
(9, 'Had a great time with family after work.'),
(9, 'Looking forward to the weekend to relax.'),
(9, 'Staying on track with my health goals.'),

-- Notes for journal entries of user 4
(10, 'Spent the day with family, it was nice.'),
(10, 'Had a long walk and felt refreshed.'),
(10, 'I’m keeping up with my fitness goals.'),
(10, 'I feel grateful for today’s moments.'),
(10, 'Managed to find time for myself.'),

(11, 'Took a quiet day off to reflect.'),
(11, 'Worked on a personal project today.'),
(11, 'Feeling more in control of my schedule.'),


(12, 'Struggling with a few challenges today.'),
(12, 'Aiming to finish a pending project tomorrow.'),
(12, 'Maybe I should plan my days better.'),

-- Notes for journal entries of user 5
(13, 'Spent quality time with my kids today.'),
(13, 'Helped them with homework and projects.'),
(13, 'Feel good about how we connected today.'),
(13, 'Need to find more time for activities like this.'),


(14, 'Work was a bit hectic today.'),
(14, 'Missed lunch break due to back-to-back meetings.'),
(14, 'Need to manage my work-life balance better.'),
(14, 'Kids were understanding despite my busy day.'),
(14, 'Planning a family outing this weekend.'),

(15, 'Did a workout session with the kids.'),
(15, 'Feeling physically and mentally rejuvenated.'),
(15, 'We all had fun while staying active.'),
(15, 'These moments really help us bond.'),
(15, 'Looking forward to more active family time.'),

-- Notes for journal entries of user 6
(16, 'Had a productive workday.'),
(16, 'Made some time for self-care.'),
(16, 'Kept up with my personal goals.'),


(17, 'Felt positive and accomplished today.'),
(17, 'Took a break from work to relax.'),
(17, 'Kids had a fun time during our evening walk.'),
(17, 'Aiming to get more sleep tonight.'),
(17, 'Glad I could stay on top of my schedule.'),

(18, 'It’s been a busy but rewarding day.'),
(18, 'Got to spend time with my family.'),
(18, 'I’m proud of the progress I’m making.'),
(18, 'Had a meaningful conversation with my partner.'),
(18, 'Looking forward to winding down tomorrow.'),

-- Notes for journal entries of user 3 (continued)
(19, 'Feeling motivated to tackle today’s challenges.'),
(19, 'The team meeting went well, good collaboration.'),


-- Notes for journal entries of user 4 (continued)
(20, 'Today was extremely productive at work.'),
(20, 'Had a nice chat with my kids after dinner.'),
(20, 'Feeling a bit worn out but happy with progress.'),
(20, 'Looking forward to relaxing this weekend.'),
(20, 'Need to work on time management.'),

(21, 'Had a peaceful morning before work started.'),
(21, 'Feeling the pressure of deadlines but staying calm.'),
(21, 'Kids are excited about their upcoming school event.'),
(21, 'Taking things one step at a time.'),
(21, 'Looking forward to a peaceful weekend.'),

-- Notes for journal entries of user 5 (continued)
(22, 'Work felt more manageable today.'),
(22, 'Took a walk during lunch to clear my mind.'),
(22, 'Kids had a fun time at the park.'),


(23, 'Spent the evening helping my son with a school project.'),
(23, 'Work went smoothly today.'),
(23, 'Had a nice conversation with my partner about the weekend plans.'),


(24, 'Workday was hectic but managed to stay calm.'),
(24, 'The kids were a handful today, but we managed.'),
(24, 'Looking forward to a good night’s sleep.'),
(24, 'Feeling a bit stressed, but it’s manageable.'),
(24, 'Grateful for family support today.'),

-- Notes for journal entries of user 6 (continued)
(25, 'Woke up feeling refreshed and ready for the day.'),
(25, 'Productive morning at work, hit all my goals.'),
(25, 'Had some quality family time in the evening.'),
(25, 'Feeling balanced and optimistic.'),
(25, 'Need to stick with this positive momentum.'),

(26, 'Feeling a bit overwhelmed but trying to stay focused.'),
(26, 'Work took longer than expected today.'),
(26, 'Had dinner with the family, which was nice.'),
(26, 'Looking forward to some rest this weekend.'),
(26, 'Need to reset and recharge for next week.'),

(27, 'Work deadlines are looming, feeling the pressure.'),
(27, 'Taking small breaks to avoid burnout.'),
(27, 'Had a relaxing family evening despite the workload.'),


-- Notes for journal entries of user 6 (continued)
(28, 'Had a productive morning, feeling energized.'),
(28, 'Spent some time outdoors, which helped clear my mind.'),
(28, 'Family dinner was fun, we laughed a lot.'),


(29, 'Had some downtime with the family in the evening.'),
(29, 'Work-life balance is improving, slowly but surely.'),
(29, 'Looking forward to the weekend to recharge.'),

(30, 'Busy day at work, but got everything done.'),
(30, 'Enjoyed a quiet evening with the family.'),
(30, 'Feeling accomplished after a long day.'),
(30, 'Need to work on being more consistent with my routines.'),
(30, 'Happy to be making progress on personal goals.'),

-- Notes for journal entries of user 4 (continued)
(31, 'Woke up feeling refreshed and ready for the day.'),
(31, 'Work was manageable, got through it without stress.'),


(32, 'Had a rough morning but the day got better.'),
(32, 'Work felt overwhelming, but I pushed through.'),
(32, 'Spent some time with family in the evening, which helped.'),
(32, 'Trying to balance work and personal life better.'),
(32, 'Need to take more breaks to avoid burnout.'),

(33, 'Productive day at work, feeling accomplished.'),
(33, 'Kids were in a good mood, which made the evening easier.'),
(33, 'Had a relaxing evening after a long day.'),
(33, 'Feeling more in control of my time.'),
(33, 'Looking forward to a quiet weekend.'),

-- Notes for journal entries of user 5 (continued)
(34, 'Busy day at work, but it was manageable.'),
(34, 'Kids had a good day at school.'),
(34, 'Looking forward to a peaceful evening.'),


(35, 'Feeling a bit under the weather today.'),
(35, 'Work was a struggle, but I pushed through.'),
(35, 'Kids helped cheer me up in the evening.'),
(35, 'Taking it easy tonight to recover.'),
(35, 'Looking forward to a better day tomorrow.'),

(36, 'Busy day but stayed focused and got everything done.'),
(36, 'Spent some time with the family in the evening.'),
(36, 'Feeling accomplished after a productive day.'),
(36, 'Looking forward to the weekend to relax.'),
(36, 'Need to stay consistent with my routines.'),

-- Notes for journal entries of user 6 (continued)
(37, 'Had a productive morning, feeling good about work.'),
(37, 'Took a break to clear my mind, it helped.'),
(37, 'Spent time with the family in the evening, feeling content.'),
(37, 'Work is becoming more manageable.'),
(37, 'Grateful for the balance I’m finding.'),

(38, 'Feeling a bit overwhelmed, but staying focused.'),
(38, 'Work took longer than expected today.'),
(38, 'Had a relaxing dinner with the family.'),
(38, 'Looking forward to some rest this weekend.'),
(38, 'Need to recharge for next week’s challenges.'),

(39, 'Feeling stressed with upcoming deadlines.'),
(39, 'Taking small breaks to avoid burnout.'),
(39, 'Had a peaceful family evening, it helped me relax.'),
(39, 'Work-life balance is improving slowly.'),
(39, 'Staying positive despite the pressure.'),

-- Seed Data for Notes (continuing from entry_id 40)
(40, 'Today was a relaxing day.'),
(40, 'I made time to meditate.'),
(40, 'Had a long phone call with an old friend.'),
(40, 'Tried a new smoothie recipe.'),
(40, 'Feeling optimistic about the week ahead.'),

(41, 'I need to start planning for the upcoming project.'),
(41, 'Busy day at work, but I managed to stay focused.'),
(41, 'Going to the gym felt great today.'),
(41, 'Need to catch up on some reading.'),
(41, 'Had a lovely dinner with family.'),

(42, 'Feeling a bit stressed with all the deadlines.'),
(42, 'Took a long walk to clear my mind.'),
(42, 'Planning a weekend getaway for some relaxation.'),
(42, 'Enjoying my new hobby: photography.'),
(42, 'Need to prioritize my tasks better.'),

(43, 'Had a great meeting with the team.'),
(43, 'Feeling more confident in my role.'),
(43, 'Learned something new today.'),
(43, 'Trying to incorporate more vegetables in my diet.'),
(43, 'Thinking about starting a new book soon.'),

(44, 'Need to plan activities for the kids this weekend.'),
(44, 'Had a productive day at work.'),
(44, 'Feeling grateful for supportive friends.'),
(44, 'Taking time to relax is essential.'),
(44, 'I should explore new hobbies more often.'),

(45, 'I had a wonderful family dinner tonight.'),
(45, 'Trying to stick to my exercise routine.'),
(45, 'Focusing on my personal growth.'),
(45, 'Need to practice mindfulness more regularly.'),
(45, 'Planning to reconnect with old friends.'),

(46, 'Today was filled with positive energy.'),
(46, 'Had a fulfilling day at work.'),
(46, 'Explored a new park in the area.'),
(46, 'Feeling inspired to create something new.'),
(46, 'Need to get back into journaling.'),

(47, 'Feeling anxious about the upcoming presentation.'),
(47, 'I need to practice more to feel prepared.'),
(47, 'Took a break to go for a run.'),
(47, 'Talking to a friend helped ease my worries.'),
(47, 'I plan to visualize my success during the presentation.'),

(48, 'Had a great lunch with colleagues.'),
(48, 'I’m learning to be more assertive at work.'),
(48, 'Trying to keep a positive attitude.'),
(48, 'Planning a trip to the mountains next month.'),
(48, 'Feeling excited about new opportunities.'),

(49, 'Family movie night was so much fun!'),
(49, 'Kids loved the new animated film.'),
(49, 'I enjoyed making popcorn together.'),
(49, 'Looking forward to next week’s family outing.'),
(49, 'Remembering to cherish these moments.'),

(50, 'Feeling overwhelmed with my to-do list.'),
(50, 'I need to prioritize better.'),
(50, 'Taking breaks helps me stay focused.'),
(50, 'Going to make a schedule to manage tasks.'),
(50, 'Need to ask for help when I need it.'),

(51, 'Had a wonderful day visiting family.'),


(52, 'Today was productive; finished a big project.'),
(52, 'Took time to celebrate small wins.'),


(53, 'I went hiking today; it was refreshing.'),
(53, 'The weather was perfect for outdoor activities.'),
(53, 'Captured beautiful photos of nature.'),
(53, 'I felt recharged after being outdoors.'),
(53, 'Thinking about making hiking a regular activity.'),

(54, 'Attended a workshop on personal development.'),
(54, 'I learned valuable skills to apply at work.'),
(54, 'Networking with others was beneficial.'),
(54, 'I’m inspired to take action on my goals.'),
(54, 'Need to implement what I learned this week.'),

(55, 'Spent time volunteering at the community center.'),
(55, 'I feel fulfilled helping others.'),
(55, 'The experience opened my eyes to new perspectives.'),
(55, 'I want to continue giving back to the community.'),
(55, 'Feeling thankful for the opportunity to serve.'),

(56, 'Feeling excited about the upcoming vacation.'),
(56, 'I need to finalize the itinerary.'),


(57, 'Today was a tough day at work.'),
(57, 'I felt overwhelmed with deadlines.'),
(57, 'I reached out for help from my team.'),


(58, 'Had a great workout at the gym.'),
(58, 'Need to stay consistent with my exercise.'),
(58, 'I feel more energized throughout the day.'),

(59, 'Spent quality time with my partner today.'),
(59, 'We went for a romantic dinner.'),


(60, 'Had a productive day working on personal projects.'),
(60, 'I made significant progress on my goals.'),
(60, 'I need to keep the momentum going.'),
(60, 'Sharing my progress with friends helps.'),
(60, 'I feel accomplished and motivated.'),

(61, 'Today was filled with challenges.'),
(61, 'I learned to stay calm under pressure.'),



(62, 'I want to make this a weekly ritual.'),
(62, 'Feeling grateful for the little things in life.'),

(63, 'Started a new hobby today: painting.'),
(63, 'I found it therapeutic and enjoyable.'),
(63, 'I’m excited to explore my creative side.'),


(64, 'I had a productive meeting with my manager.'),
(64, 'We discussed my career goals and aspirations.'),
(64, 'I feel supported in my professional growth.'),


(65, 'I took a break today to read a book.'),
(65, 'Reading helps me relax and unwind.'),
(65, 'I want to make more time for books.'),



(66, 'I finally tried a new recipe today.'),
(66, 'It turned out better than I expected!'),
(66, 'Cooking is a great way to express creativity.'),

(67, 'Had a challenging workout session.'),
(67, 'Pushed myself harder than usual.'),
(67, 'I’m proud of my determination.'),


(68, 'Caught up with an old friend today.'),
(68, 'We reminisced about our college days.'),


(69, 'Spent the day volunteering at a local shelter.'),
(69, 'It was fulfilling to help those in need.'),
(69, 'I learned a lot from the experience.'),


(70, 'Took a short trip to the beach.'),
(70, 'The sound of the waves was calming.'),
(70, 'I enjoyed a lovely sunset.'),
(70, 'I need to spend more time in nature.'),
(70, 'Beach days always lift my spirits.'),

(71, 'I’m starting to write in my journal daily.'),
(71, 'It helps me reflect on my thoughts.'),
(71, 'I want to explore my feelings more deeply.'),


(72, 'Had a fun day at the amusement park.'),
(72, 'Riding roller coasters was exhilarating!'),
(72, 'I enjoyed spending time with family.'),


(73, 'Learned a new skill today: photography.'),
(73, 'I captured some beautiful moments.'),
(73, 'Photography helps me see the world differently.'),


(74, 'I attended a workshop on personal development.'),
(74, 'I learned valuable strategies for growth.'),
(74, 'I’m eager to apply what I learned.'),


(75, 'I had a cozy day at home.'),
(75, 'Watched movies and relaxed.'),
(75, 'Home is my favorite place to unwind.'),
(75, 'I appreciate the comfort of my space.'),
(75, 'I need to have more self-care days.'),

(76, 'I tried meditation for the first time.'),
(76, 'It was difficult to quiet my mind.'),
(76, 'I felt a sense of peace afterward.'),

(77, 'Celebrated a family member’s birthday today.'),
(77, 'The gathering was full of joy.'),
(77, 'I cherish these family moments.'),


(78, 'Completed a challenging puzzle today.'),
(78, 'It was satisfying to see the final picture.'),
(78, 'I enjoy activities that make me think.'),


(79, 'Spent time gardening today.'),
(79, 'I find it therapeutic to be outdoors.'),
(79, 'The plants are starting to bloom.'),


(80, 'Had a quiet evening reading a book.'),
(80, 'I got lost in the story.'),
(80, 'Books transport me to different worlds.'),


(81, 'I faced a tough decision today.'),
(81, 'I reached out to friends for advice.'),
(81, 'Decisions shape our paths, and I’ll be mindful.'),

--alex johnson

-- Notes for entry 82
(82, 'Had a productive morning workout.'),
(82, 'Managed to complete all tasks on time.'),
(82, 'Felt a bit overwhelmed but stayed focused.'),

-- Notes for entry 83
(83, 'Enjoyed a peaceful lunch break.'),
(83, 'Connected with an old friend.'),
(83, 'Struggled to keep up with the workload today.'),
(83, 'Made progress on a side project.'),

-- Notes for entry 84
(84, 'Started reading a new book.'),
(84, 'Enjoyed some quality time with family.'),
(84, 'Feeling grateful for the little moments.'),

-- Notes for entry 85
(85, 'Overslept a bit but caught up on work.'),
(85, 'Completed a challenging task successfully.'),
(85, 'Had a productive brainstorming session.'),

-- Notes for entry 86
(86, 'Felt really motivated today.'),
(86, 'Took a nice walk after dinner.'),
(86, 'Had some positive feedback at work.'),

-- Notes for entry 87
(87, 'Struggled with focus in the morning.'),
(87, 'Got a lot done in the afternoon.'),
(87, 'Looking forward to tomorrow.'),
(87, 'Had a great conversation with a mentor.'),

-- Notes for entry 88
(88, 'Started the day with meditation.'),
(88, 'Got some chores done early.'),
(88, 'Weather was gloomy but didn’t affect my mood.'),

-- Notes for entry 89
(89, 'Achieved all daily goals.'),
(89, 'Celebrated a small win at work.'),
(89, 'Relaxed with some music in the evening.'),
(89, 'Feeling positive and energized.'),

-- Notes for entry 90
(90, 'Started the day strong but lost energy later.'),
(90, 'Managed to get through everything on my list.'),

-- Notes for entry 91
(91, 'Felt a bit stressed in the morning.'),
(91, 'Had a productive afternoon.'),
(91, 'Took a break to clear my mind.'),
(91, 'Happy with the day overall.'),
(91, 'Had a great evening workout.'),
(91, 'Looking forward to a good nights rest.'),
(91, 'Reflected on the week accomplishments.');







-- Seed Data for Resources
INSERT INTO resources (title, url, resource_type, description, created_at) VALUES
('Mindfulness Meditation', 'https://www.mindful.org/what-is-mindfulness/', 'Article', 'A comprehensive guide to mindfulness practices.', now()),
('Stress Relief Techniques', 'https://www.healthline.com/health/stress-relief-techniques', 'Video', 'A video tutorial on stress relief techniques.', now()),
('Mental Health Support', 'https://www.mentalhealth.gov/', 'Forum', 'A forum for mental health support and resources.', now()),
('Parenting Tips', 'https://www.parenting.com/', 'Blog', 'Blog posts with practical parenting tips and advice.', now()),
('Exercise for Mental Health', 'https://www.verywellfit.com/exercise-mental-health-4157217', 'Article', 'The benefits of physical exercise on mental health.', now());




-- Insert categories with image URLs
INSERT INTO forum_categories (name, description, img_url) VALUES
('Toddlers', 'Share experiences, challenges, and joys of being a father', 'https://example.com/images/toddlers.jpg'),
('Teens', 'A safe space to discuss mental health struggles and seek support', 'https://example.com/images/teens.jpg'),
('Experiences', 'Tips and discussions on physical and mental health for men', 'https://example.com/images/experiences.jpg'),
('Parenting Tips', 'Share and learn practical parenting tips and advice', 'https://example.com/images/parenting_tips.jpg'),
('Single Fathers', 'A place for single fathers to connect and share their unique experiences', 'https://example.com/images/single_fathers.jpg');



-- Insert seed data for forum entries with likes_count set to 0
INSERT INTO forum_entry (entry, category_id, user_id, likes_count, created_at) 
VALUES 
-- Category 1: Toddlers
('What are some tips for getting my toddler to sleep better at night?', 1, 1, 0, '2024-03-05 10:45:00'),
('Looking for fun game ideas to play with my toddler, anyone have suggestions?', 1, 3, 0, '2024-03-06 11:15:00'),
('How do you deal with tantrums in Public, it''s quite stressful.', 4, 4, 0, '2024-03-07 13:20:00'),
('What are some great educational toys that my toddler would really enjoy?', 1, 6, 0, '2024-03-08 14:30:00'),

-- Category 2: Teens
('How to Talk to Your Teen About Mental Health', 2, 2, 0, '2024-03-09 15:10:00'),
('Balancing Freedom and Responsibility for Teens', 2, 5, 0, '2024-03-10 09:40:00'),
('Dealing with Mood Swings in Teens', 2, 7, 0, '2024-03-11 12:50:00'),
('Supporting Your Teen Through Peer Pressure', 2, 9, 0, '2024-03-12 08:30:00'),

-- Category 3: Experiences
('Fellow dads, how do you successfully balance the demands of work and family life?', 3, 7, 0, '2024-03-13 16:10:00'),
('Fathers, I''m interested in hearing how you have prioritized your own mental health and wellbeing.', 3, 2, 0, '2024-03-14 18:05:00'),
('What are some fitness tips and tricks that help the whole family be healthy together?', 3,5, 0, '2024-03-15 10:55:00'),


-- Category 4: Parenting Tips
('Tips for Establishing Routines with Young Children', 4, 2, 0, '2024-03-16 09:35:00'),
('Disciplining Without Yelling: A Better Approach', 4, 4, 0, '2024-03-17 11:45:00'),
('Encouraging Positive Behavior in Kids', 4, 5, 0, '2024-03-18 13:25:00'),

-- Category 5: Single Fathers
('Navigating Co-Parenting as a Single Father', 5, 4, 0, '2024-03-19 15:20:00'),
('How to Build a Support Network as a Single Dad', 5, 7, 0, '2024-03-20 09:10:00'),
('Balancing Work and Kids as a Single Parent', 5, 6, 0, '2024-03-21 10:15:00'),
('Balancing Career Goals and Parenting Challenges', 4, 10, 0, '2024-03-27 10:00:00'),

('Fellow dads, how do you successfully balance the demands of work and family life?', 3, 10, 0, '2024-03-28 08:00:00');


-- Insert seed data for comments
INSERT INTO comments (entry_id, user_id, comment, created_at) VALUES
-- Comments for Category 1: Toddlers
(1, 2, 'Man, toddlers sure know how to test your patience. I swear mine has a sixth sense for when I’m tired!', '2024-03-05 12:30:00'),
(1, 5, 'Totally feel you! It’s like they can smell weakness. But hey, they grow out of it... right?', '2024-03-05 13:45:00'),
(1, 8, 'Wish I had this advice earlier! I could’ve avoided some major public meltdowns!', '2024-03-06 14:10:00'),

(2, 4, 'Starting solid foods is a mess, but also the funniest part! Pro tip: spaghetti is more art than food at this stage!', '2024-03-06 15:50:00'),
(2, 7, 'Omg, yes! Recipe swaps are a must! We should start a messy food chronicles thread!', '2024-03-07 10:25:00'),

(3, 6, 'These toddler games are lifesavers! My kid loves making a mess, but hey, at least it’s controlled chaos!', '2024-03-07 17:40:00'),

(4, 9, 'Discipline is like walking a tightrope—one wrong move, and you’re off the edge! Would love to hear others’ experiences!', '2024-03-08 11:00:00'),
(4, 5, 'It’s all about consistency... or so they say. Some days I’m just winging it!', '2024-03-08 16:30:00'),

(5, 6, 'Screen time? Pfft, I’m just trying to survive over here! Timers have been a game changer though.', '2024-03-09 09:55:00'),

-- Comments for Category 2: Teens
(6, 8, 'Being a dad of a teen is like entering the twilight zone! Glad I’m not alone in feeling lost sometimes.', '2024-03-10 10:40:00'),
(6, 3, 'Yesss! Self-care should be on every dad’s to-do list. It’s easy to forget about ourselves.', '2024-03-10 11:50:00'),

(7, 4, 'Mood swings? More like an emotional rollercoaster every day! I need all the tips I can get.', '2024-03-11 14:30:00'),
(7, 9, 'Mindfulness has been a huge help for me, too. It’s the deep breaths that keep me going.', '2024-03-11 16:00:00'),

(8, 5, 'Peer pressure is such a biggie! Having a support system is everything.', '2024-03-12 12:10:00'),

-- Comments for Category 3: Experiences
(9, 2, 'Work-life balance is an illusion, but we keep trying! Any tips for not losing your mind?', '2024-03-13 09:20:00'),
(9, 7, 'It’s all about setting boundaries... and sticking to them. Easier said than done, right?', '2024-03-13 11:40:00'),

(10, 3, 'Time management? More like trying to juggle flaming swords! Always open to new hacks though.', '2024-03-14 15:00:00'),

(11, 4, 'Creating a family calendar was a game changer for me! Now I just have to get everyone to actually use it.', '2024-03-15 16:10:00'),
(11, 9, 'Being present is HARD! But when you nail it, man, it feels great.', '2024-03-16 10:30:00'),

-- Comments for Category 4: Parenting Tips
(12, 8, 'Watching them hit milestones is like magic! One day they’re crawling, and the next they’re running the house!', '2024-03-17 13:50:00'),
(12, 7, 'Yes! Play is everything. It’s how they grow and learn. Let’s keep sharing ideas on this.', '2024-03-18 14:10:00'),

(13, 9, 'Fostering independence is no joke! But seeing them take charge is so worth it.', '2024-03-19 10:20:00'),
(13, 5, 'This advice is pure gold! I’m taking notes and putting them into action asap.', '2024-03-20 11:45:00'),

(14, 6, 'Spotting early learning disabilities is such a big deal! Every parent needs to be informed on this.', '2024-03-21 09:55:00'),

-- Comments for Category 5: Single Fathers
(15, 2, 'Game nights? YES! Bonding over games has been my go-to. Let’s trade some ideas!', '2024-03-22 16:10:00'),
(15, 4, 'Outdoor activities are a lifesaver! The more fresh air the better, especially for winding down.', '2024-03-23 18:20:00'),

(16, 9, 'Crafting with the kids is a blast! Any cool project ideas out there?', '2024-03-24 14:35:00'),

(17, 8, 'Traveling with kids is like signing up for chaos. But the stories... they’re worth it!', '2024-03-25 15:40:00'),
(17, 3, 'Volunteering with the family has been such a rewarding experience. Let’s share some awesome opportunities!', '2024-03-26 17:10:00'),

-- Extra comments for variety
(1, 6, 'Oh man, the tantrums can get real intense! I feel like I’m in survival mode most days.', '2024-03-05 15:00:00'),
(3, 2, 'Water play is a lifesaver! It’s my secret weapon to calm my kid down on bad days.', '2024-03-06 16:25:00'),
(5, 9, 'Timers have been great for keeping screen time in check, and my kids actually stick to it!', '2024-03-09 11:25:00'),
(18, 1, 'Finding time for career growth while raising kids is no easy feat!', '2024-03-27 11:15:00'),
(18, 3, 'I totally relate! Every day feels like a juggling act.', '2024-03-27 12:30:00'),
(18, 5, 'Sometimes, it’s about accepting that some days will be about the kids, and others about work.', '2024-03-27 13:45:00'),
(18, 7, 'Setting priorities is key, but it’s still challenging. Kudos to all the parents out there!', '2024-03-27 15:00:00'),
(18, 8, 'The struggle is real! But the rewards are worth it.', '2024-03-27 16:20:00'),
(18, 2, 'Balance is a myth! It’s all about managing chaos.', '2024-03-27 17:30:00'),
(18, 9, 'Good to know we’re all in this together—parenting isn’t easy!', '2024-03-27 18:45:00'),

(19, 1, 'Its tough balancing work and family life Alex. Try setting aside a dedicated time daily, even if its brief.', '2024-03-28 10:15:00'),
(19, 3, 'Alex. One thing that helped me was creating small "rituals" like a nightly story or a weekend walk. Its not about the quantity of time.', '2024-03-28 11:30:00'),
(19, 5, 'Connecting with kids can feel elusive sometimes, but if you just show interest in their world — it can really help build that bond.', '2024-03-28 12:45:00'),
(19, 7, 'Something thats worked for me is incorporating them into my daily routine! It turns chores into shared time.', '2024-03-28 14:00:00'),
(19, 8, 'I UNPLUG from tech when Im with my kids. Being present, even for short moments, has really strengthened our relationship.', '2024-03-28 15:15:00'),
(19, 2, 'Use mealtime or bath time to connect. I promise that your undivided attention, even briefly, means the world to your kids.', '2024-03-28 16:30:00'),
(19, 9, 'Hang in there, Alex. Kids dont need perfect, they just need you. Keep trying even if its small gestures—they add up over time.', '2024-03-28 17:45:00');





INSERT INTO forum_likes (user_id, forum_entry_id) VALUES
(1, 1),
(2, 1),
(3, 1),
(2, 2),
(4, 3),
(1, 4),
(6, 4),
(3, 5),
(7, 6),
(2, 7),
(4, 8),
(5, 9),
(3, 10),
(1, 11),
(8, 12),
(7, 13),
(4, 14),
(5, 15),
(9, 16),
(2, 17);


INSERT INTO comments_likes (user_id, comment_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(1, 10),
(2, 11),
(3, 12),
(4, 13),
(5, 14),
(7, 15),
(8, 16),
(9, 17),
(1, 18);
