const db = require('../db/dbConfig');

// Get all notes for a specific journal entry
const getAllNotesByEntryId = async (entryId) => {
    return db.any('SELECT * FROM notes WHERE entry_id = $1', [entryId]);
};
const getJournalEntryById = async (entryId) => {
    return db.oneOrNone('SELECT * FROM journal_entries WHERE id = $1', [entryId]);
};
// Get a specific note by entry ID
const getNoteByEntryId = async (entryId) => {
    return db.oneOrNone('SELECT * FROM notes WHERE entry_id = $1', [entryId]);
};

// Create a new note
const createNote = async (noteData) => {
    return db.one(
        'INSERT INTO notes (entry_id, note) VALUES ($1, $2) RETURNING *',
        [noteData.entry_id, noteData.note]
    );
};


// Update a note
const updateNote = async (noteId, noteData) => {
    return db.oneOrNone(
        'UPDATE notes SET note = $1 WHERE id = $2 RETURNING *',
        [noteData.note, noteId]
    );
};


// Delete a note
const deleteNote = async (entryId, noteId) => {
    return db.result('DELETE FROM notes WHERE entry_id = $1 AND id = $2', [entryId, noteId]);
};


const getNoteById = async (noteId) => {
    return db.oneOrNone('SELECT * FROM notes WHERE id = $1', [noteId]);
};


// Get a journal entry by userId and entryId to check if the entry belongs to the user
const getJournalEntryByUserId = async (userId, entryId) => {
    return db.oneOrNone('SELECT * FROM journal_entries WHERE id = $1 AND user_id = $2', [entryId, userId]);
};




module.exports = {
    getAllNotesByEntryId,
    getNoteByEntryId,
    createNote,
    updateNote,
    deleteNote,
    getNoteById,
    getJournalEntryByUserId,
    getJournalEntryById
};
