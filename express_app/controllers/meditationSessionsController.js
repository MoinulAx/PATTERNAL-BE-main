// controllers/meditationSessionsController.js

const {
    getAllMeditationSessions,
    getMeditationSessionById,
    createMeditationSession,
    updateMeditationSession,
    deleteMeditationSession
} = require('../queries/meditationSessions');


// Get all meditation sessions
const getAllSessions = async (req, res) => {
    const sessions = await getAllMeditationSessions();
    if (sessions.length) {
        res.status(200).json(sessions);
    } else {
        res.status(500).json({ error: 'No meditation sessions found' });
    }
};

// Get one meditation session by ID
const getOneSession = async (req, res) => {
    const { id } = req.params;
    const session = await getMeditationSessionById(id);
    if (session) {
        res.status(200).json(session);
    } else {
        res.status(404).json({ error: 'Meditation session not found' });
    }
};

// Create a new meditation session
const createSession = async (req, res) => {
    const newSession = await createMeditationSession(req.body);
    res.status(201).json(newSession);
};

// Update a meditation session
const updateSession = async (req, res) => {
   
    const { id } = req.params;
    const updatedSession = await updateMeditationSession(id, req.body);
    res.status(200).json(updatedSession);
    
};

// Delete a meditation session
const deleteSession = async (req, res) => {

    const { id } = req.params;
    const deletedSession = await deleteMeditationSession(id);
    res.status(200).json(deletedSession);

};

module.exports = {
    getAllSessions,
    getOneSession,
    createSession,
    updateSession,
    deleteSession
};
