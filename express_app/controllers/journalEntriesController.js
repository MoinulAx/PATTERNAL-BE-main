const {
    getAllJournalEntriesByUserId,
    getJournalEntryByIdForUser,
    createJournalEntry,
    updateJournalEntry,
    deleteJournalEntry
} = require('../queries/journalEntries');

// Get all journal entries for a specific user
const getAllEntries = async (req, res) => {
    const { userId } = req.params;  
    try {
        const entries = await getAllJournalEntriesByUserId(userId);
        if (entries.length) {
            res.status(200).json(entries);
        } else {
            res.status(404).json({ error: 'No journal entries found for this user' });
        }
    } catch (err) {
        res.status(500).json({ error: 'An error occurred while fetching journal entries', details: err });
    }
};

// Get one journal entry for a specific user
const getOneEntry = async (req, res) => {
    const { userId, entryId } = req.params;
    try {
        const entry = await getJournalEntryByIdForUser(userId, entryId);
        if (entry) {
            res.status(200).json(entry);
        } else {
            res.status(404).json({ error: 'Journal entry not found or does not belong to this user' });
        }
    } catch (err) {
        res.status(500).json({ error: 'An error occurred while fetching the journal entry', details: err });
    }
};

// Create a journal entry for a user
const createEntry = async (req, res) => {
    const { userId } = req.params;
    try {
        const newEntry = await createJournalEntry({ ...req.body, user_id: userId });
        res.status(201).json(newEntry);
    } catch (err) {
        res.status(500).json({ error: 'An error occurred while creating the journal entry', details: err });
    }
};

// Update a journal entry
const updateEntry = async (req, res) => {
    const { userId, entryId } = req.params;
    try {
        const updatedEntry = await updateJournalEntry(userId, entryId, req.body); // Ensure user owns the entry
        if (updatedEntry) {
            res.status(200).json(updatedEntry);
        } else {
            res.status(404).json({ error: 'Journal entry not found or does not belong to this user' });
        }
    } catch (err) {
        res.status(500).json({ error: 'An error occurred while updating the journal entry', details: err });
    }
};

// Delete a journal entry
const deleteEntry = async (req, res) => {
    const { userId, entryId } = req.params;
    try {
        const deletedEntry = await deleteJournalEntry(userId, entryId); // Ensure user owns the entry
        if (deletedEntry) {
            res.status(200).json(deletedEntry);
        } else {
            res.status(404).json({ error: 'Journal entry not found or does not belong to this user' });
        }
    } catch (err) {
        res.status(500).json({ error: 'An error occurred while deleting the journal entry', details: err });
    }
};

module.exports = {
    getAllEntries,
    getOneEntry,
    createEntry,
    updateEntry,
    deleteEntry
};
