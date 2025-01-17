const express = require('express');
const router = express.Router({ mergeParams: true });
const {
    getAllQuestionsForEntry,
    createJournalQuestion,
    updateJournalQuestion,
    deleteJournalQuestion,
    getOneQuestionForEntry
} = require('../controllers/journalQuestionController');
// const journalResponseRoutes = require('./journalResponsesRoutes'); 

// Get all questions for a specific journal entry
router.get('/', getAllQuestionsForEntry); // Adjusted to be the base for entryId

// Get one specific journal question by ID
router.get('/:id', getOneQuestionForEntry); 

// Create a new journal question for a specific entry
router.post('/', createJournalQuestion);



// Update a specific journal question
router.put('/:id', updateJournalQuestion);

// Delete a specific journal question
router.delete('/:id', deleteJournalQuestion);

// router.use('/:questionId/response', (req, res, next) => {
//     console.log('QuestionId ID from the request:', req.params.questionId);
//     next()
// }, journalResponseRoutes);

module.exports = router;
