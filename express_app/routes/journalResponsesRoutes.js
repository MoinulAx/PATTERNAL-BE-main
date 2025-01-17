const express = require('express');
const router = express.Router({ mergeParams: true });
const journalResponsesController = require('../controllers/journalResponsesController'); 
// Journal Responses Routes
router.get('/', journalResponsesController.getAllResponsesForQuestion);
router.post('/', journalResponsesController.createJournalResponse);
router.get('/:id', journalResponsesController.getOneResponseController); 
router.put('/:id', journalResponsesController.updateJournalResponse);
router.delete('/:id', journalResponsesController.deleteJournalResponse);

module.exports = router;
