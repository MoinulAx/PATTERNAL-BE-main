// queries/meditationSessions.js
const db = require('../db/dbConfig');

// Get all meditation sessions
const getAllMeditationSessions = async () => {
    try {
        const allSessions = await db.any('SELECT * FROM meditation_sessions');
        return allSessions;
    } catch (err) {
        return err;
    }
};

// Get a single meditation session by ID
const getMeditationSessionById = async (id) => {
    try {
        const session = await db.oneOrNone('SELECT * FROM meditation_sessions WHERE id = $1', id);
        return session;
    } catch (err) {
        return err;
    }
};

// Create a new meditation session
const createMeditationSession = async (session) => {
    try {
        const newSession = await db.one(
            'INSERT INTO meditation_sessions (user_id, session_length, created_at) VALUES ($1, $2, now()) RETURNING *',
            [session.user_id, session.session_length]
        );
        return newSession;
    } catch (err) {
        return err;
    }
};

// Update a meditation session
const updateMeditationSession = async (id, session) => {
    try {
        const updatedSession = await db.one(
            'UPDATE meditation_sessions SET session_length = $1 WHERE id = $2 RETURNING *',
            [session.session_length, id]
        );
        return updatedSession;
    } catch (err) {
        return err;
    }
};

// Delete a meditation session
const deleteMeditationSession = async (id) => {
    try {
        const deletedSession = await db.oneOrNone('DELETE FROM meditation_sessions WHERE id = $1 RETURNING *', id);
        return deletedSession;
    } catch (err) {
        return err;
    }
};

module.exports = {
    getAllMeditationSessions,
    getMeditationSessionById,
    createMeditationSession,
    updateMeditationSession,
    deleteMeditationSession
};
