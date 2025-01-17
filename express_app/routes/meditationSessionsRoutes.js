// routes/meditationSessions.js
const express = require('express');
const router = express.Router();
const {
    getAllSessions,
    getOneSession,
    createSession,
    updateSession,
    deleteSession
} = require('../controllers/meditationSessionsController');

// Get all meditation sessions
router.get('/', getAllSessions);

// Get one meditation session by ID
router.get('/:id', getOneSession);

// Create a new meditation session
router.post('/', createSession);

// Update an existing meditation session
router.put('/:id', updateSession);

// Delete a meditation session
router.delete('/:id', deleteSession);

module.exports = router;
