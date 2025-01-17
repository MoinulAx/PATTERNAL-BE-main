const db = require('../db/dbConfig');

// Get all responses for a specific journal question
const getAllResponsesForQuestion = async (questionId) => {
    return await db.any('SELECT * FROM journal_responses WHERE question_id = $1', [questionId]);
};

// Create a new response for a specific journal question
const createJournalResponse = async (questionId, responseText) => {
    const query = `
        INSERT INTO journal_responses (question_id, response_text)
        VALUES ($1, $2)
        RETURNING *;
    `;
    const values = [questionId, responseText];
    try {
        const result = await db.query(query, values); 
        return result[0];
    } catch (error) {
        throw error;
    }
};

// Update a specific journal response
const updateJournalResponse = async (id, { response_text }) => {
    try {
        const updatedResponse = await db.one(
            'UPDATE journal_responses SET response_text = $1 WHERE id = $2 RETURNING *',
            [response_text, id]
        );
        return updatedResponse;
    } catch (error) {
        throw error; 
    }
};

// Delete a specific journal response
const deleteJournalResponse = async (id) => {
    return await db.oneOrNone('DELETE FROM journal_responses WHERE id = $1 RETURNING *', [id]);
};
const getOneResponse = async (id) => {
    try {
        const response = await db.oneOrNone('SELECT * FROM journal_responses WHERE id = $1', [id]);
        return response;
    } catch (error) {
        throw error; 
    }
};


module.exports = {
    getAllResponsesForQuestion,
    createJournalResponse,
    updateJournalResponse,
    deleteJournalResponse,
    getOneResponse
};
