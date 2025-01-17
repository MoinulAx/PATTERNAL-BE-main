const db = require('../db/dbConfig');

// Get one specific question for a specific journal entry
const getOneQuestionForEntry = async (entryId, questionId) => {
    try {
        console.log('Querying database for question with entryId:', entryId, 'and questionId:', questionId); 
        const question = await db.oneOrNone(
            'SELECT * FROM journal_questions WHERE entry_id = $1 AND id = $2',
            [entryId, questionId]
        );
        console.log('Result from database:', question); 
        return question;
    } catch (err) {
        console.error('Error fetching question:', err); 
        throw err;
    }
};

const getAllQuestionsForEntry = async (entryId) => {
    try {
        const questions = await db.any('SELECT * FROM journal_questions WHERE entry_id = $1', [entryId]);
        return questions;
    } catch (err) {
        console.error('Error fetching questions for entry:', err);
        throw err;
    }
};


// Create a new journal question for a specific entry
const createJournalQuestion = async (entryId, questionData) => {
    try {
        console.log('Creating a new question with entryId:', entryId, 'and question data:', questionData);
        const newQuestion = await db.one(
            'INSERT INTO journal_questions (entry_id, question_text, content_section, mood_level, answer) VALUES ($1, $2, $3, $4, $5) RETURNING *',
            [entryId, questionData.question_text, questionData.content_section, questionData.mood_level, questionData.answer]
        );
        console.log('New question created:', newQuestion);
        return newQuestion;
    } catch (err) {
        console.error('Error creating journal question:', err); // Log error for debugging
        throw err;
    }
};

// Update a specific journal question
const updateJournalQuestion = async (id, questionData) => {
    try {
        console.log('Updating question with id:', id, 'and question data:', questionData);
        const updatedQuestion = await db.one(
            'UPDATE journal_questions SET question_text = $1, content_section = $2, mood_level = $3, answer = $4 WHERE id = $5 RETURNING *',
            [questionData.question_text, questionData.content_section, questionData.mood_level, questionData.answer, id]
        );
        console.log('Updated question:', updatedQuestion);
        return updatedQuestion;
    } catch (err) {
        console.error('Error updating journal question:', err); // Log error for debugging
        throw err;
    }
};

// Delete a specific journal question
const deleteJournalQuestion = async (id) => {
    try {
        console.log('Deleting question with id:', id);
        const deletedQuestion = await db.oneOrNone('DELETE FROM journal_questions WHERE id = $1 RETURNING *', [id]);
        console.log('Deleted question:', deletedQuestion);
        return deletedQuestion;
    } catch (err) {
        console.error('Error deleting journal question:', err); // Log error for debugging
        throw err;
    }
};


module.exports = {
    getOneQuestionForEntry, 
    createJournalQuestion,
    updateJournalQuestion,
    deleteJournalQuestion,
    getAllQuestionsForEntry
};
