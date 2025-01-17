const journalQuestionsQueries = require('../queries/journalQuestions');
const notesQueries = require('../queries/notesQueries'); 

// Get one specific question for a specific journal entry
const getOneQuestionForEntry = async (req, res) => {
    const { entryId, id, userId } = req.params; 
    console.log('Received entryId:', entryId, 'and question ID:', id, 'for user ID:', userId);
    
    if (!id) {
        return res.status(400).json({ message: 'Question ID is required' });
    }

    try {
        // Fetch the journal entry to verify ownership
        const journalEntry = await notesQueries.getAllNotesByEntryId(entryId, userId);

        // Check if the journal entry belongs to the requesting user
        if (!journalEntry.length) {
            return res.status(404).json({ message: 'Journal entry not found or not accessible' });
        }

        // Fetch the question for the specified entry
        const question = await journalQuestionsQueries.getOneQuestionForEntry(entryId, id); 
        
        if (!question) {
            return res.status(404).json({ message: 'Question not found' });
        }

        if (question.entry_id !== parseInt(entryId)) {
            return res.status(400).json({ message: 'Question is not part of the specified journal entry' });
        }

        console.log('Question fetched:', question);
        return res.status(200).json(question);
        
    } catch (error) {
        console.error('Error fetching question:', error);
        return res.status(500).json({ message: 'Error fetching question', error });
    }
};

// Get all questions for a specific journal entry
const getAllQuestionsForEntry = async (req, res) => {
    const { entryId, userId } = req.params;
    console.log('Received entryId:', entryId, 'for user ID:', userId);
    
    try {
        // Fetch the journal entry to verify ownership
        const journalEntry = await notesQueries.getAllNotesByEntryId(entryId, userId);

        // Check if the journal entry belongs to the requesting user
        if (!journalEntry.length) {
            return res.status(404).json({ message: 'Journal entry not found or not accessible' });
        }

        const questions = await journalQuestionsQueries.getAllQuestionsForEntry(entryId);
        return res.status(200).json(questions);
    } catch (error) {
        console.error('Error fetching questions:', error);
        return res.status(500).json({ message: 'Error fetching questions', error });
    }
};


const createJournalQuestion = async (req, res) => {
    const { entryId } = req.params;
    const questionData = req.body;
    
    try {
        const newQuestion = await journalQuestionsQueries.createJournalQuestion(entryId, questionData);
        if (newQuestion) {
            res.status(201).json(newQuestion);
        } else {
            res.status(400).json({ message: 'Failed to create question' });
        }
    } catch (error) {
        console.error('Error creating question:', error);
        res.status(500).json({ message: 'Error creating question', error });
    }
};

const updateJournalQuestion = async (req, res) => {
    const { id } = req.params;
    const questionData = req.body;
    
    try {
        const updatedQuestion = await journalQuestionsQueries.updateJournalQuestion(id, questionData);
        if (updatedQuestion) {
            res.status(200).json(updatedQuestion);
        } else {
            res.status(404).json({ message: 'Question not found' });
        }
    } catch (error) {
        console.error('Error updating question:', error);
        res.status(500).json({ message: 'Error updating question', error });
    }
};

const deleteJournalQuestion = async (req, res) => {
    const { id } = req.params;
    
    try {
        const deletedQuestion = await journalQuestionsQueries.deleteJournalQuestion(id);
        if (deletedQuestion) {
            res.status(200).json({ message: 'Question deleted', deletedQuestion });
        } else {
            res.status(404).json({ message: 'Question not found' });
        }
    } catch (error) {
        console.error('Error deleting question:', error);
        res.status(500).json({ message: 'Error deleting question', error });
    }
};



module.exports = {
    getOneQuestionForEntry,
    getAllQuestionsForEntry,
    createJournalQuestion,
    updateJournalQuestion,
    deleteJournalQuestion,
    
};
