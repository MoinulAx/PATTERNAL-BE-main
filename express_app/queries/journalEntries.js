const db = require('../db/dbConfig');

// Get all journal entries for a specific user
const getAllJournalEntriesByUserId = async (userId) => {
    try {
        const allEntries = await db.any('SELECT * FROM journal_entries WHERE user_id = $1', userId);
        return allEntries;
    } catch (err) {
        return err;
    }
};

// Get a specific journal entry for a specific user
const getJournalEntryByIdForUser = async (userId, entryId) => {
    try {
        const entry = await db.oneOrNone('SELECT * FROM journal_entries WHERE id = $1 AND user_id = $2', [entryId, userId]);
        return entry;
    } catch (err) {
        return err;
    }
};

// Create a new journal entry
const createJournalEntry = async (entry) => {
    try {
      const newEntry = await db.one(
        'INSERT INTO journal_entries (user_id, mood) VALUES ($1, $2) RETURNING *',
        [entry.user_id, entry.mood]
      );
      return newEntry;
    } catch (err) {
      return err;
    }
  };
  
/// Update a journal entry (Ensure it belongs to the user)
const updateJournalEntry = async (userId, entryId, entry) => {
    try {
        const updatedEntry = await db.one(
            'UPDATE journal_entries SET mood = $1 WHERE id = $2 AND user_id = $3 RETURNING *',
            [entry.mood, entryId, userId]
        );
        return updatedEntry;
    } catch (err) {
        return err;
    }
};


// Delete a journal entry (Ensure it belongs to the user)
const deleteJournalEntry = async (userId, entryId) => {
    try {
        const deletedEntry = await db.oneOrNone('DELETE FROM journal_entries WHERE id = $1 AND user_id = $2 RETURNING *', [entryId, userId]);
        return deletedEntry;
    } catch (err) {
        return err;
    }
};

module.exports = {
    getAllJournalEntriesByUserId,
    getJournalEntryByIdForUser,
    createJournalEntry,
    updateJournalEntry,
    deleteJournalEntry
};
