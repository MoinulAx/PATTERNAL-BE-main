const express = require('express');
const router = express.Router({ mergeParams: true });
const notesController = require('../controllers/notesController');

// Get all notes for a journal entry
router.get('/', notesController.getAllNotes);

// Get a specific note by entry ID
router.get('/:noteId', notesController.getOneNoteById);

// Create a new note for a journal entry
router.post('/', notesController.createEntryNote);

// Update a note
router.put('/:noteId', notesController.updateEntryNote);

// Delete a note
router.delete('/:noteId', notesController.deleteEntryNote);

module.exports = router;
