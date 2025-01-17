const express = require('express');
const router = express.Router({ mergeParams: true }); 
const {
    getAllEntries,
    getOneEntry,
    createEntry,
    updateEntry,
    deleteEntry
} = require('../controllers/journalEntriesController');
const journalQuestionsRoutes = require('./journalQuestions'); 
const journalNotes = require('./notesRoutes')

// Get all journal entries for a specific user
router.get('/', getAllEntries);

// Get one journal entry by ID (use entryId for consistency)
router.get('/:entryId', getOneEntry);

// Create a new journal entry for a specific user
router.post('/', createEntry);

// Update an existing journal entry
router.put('/:entryId', updateEntry);

// Delete a journal entry
router.delete('/:entryId', deleteEntry);


// Use journal questions routes under the specific entry ID
router.use('/:entryId/questions', (req, res, next) => {
    console.log('Entry ID from the request:', req.params.entryId);
    next(); 
}, journalQuestionsRoutes);

router.use('/:entryId/notes', (req, res, next) => {
    console.log('Entry ID from the request:', req.params.entryId);
    next(); 
}, journalNotes);




module.exports = router;
