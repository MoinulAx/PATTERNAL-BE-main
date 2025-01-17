const {
    getAllNotesByEntryId,
    getNoteByEntryId,
    createNote,
    updateNote,
    deleteNote,
    getNoteById,
    getJournalEntryById
} = require('../queries/notesQueries'); 

// Get all notes for a specific journal e



const getAllNotes = async (req, res) => {
    const { entryId, userId } = req.params; 
    try {
        // Fetch the journal entry to verify ownership
        const journalEntry = await getJournalEntryById(entryId);

        // Check if the journal entry exists
        if (!journalEntry) {
            return res.status(404).json({ error: "Journal entry not found" });
        }

        // Check if the journal entry belongs to the requesting user
        if (journalEntry.user_id !== parseInt(userId, 10)) {
            return res.status(403).json({ error: "You do not have permission to view these notes" });
        }

        // Fetch the notes if the user owns the journal entry
        const notes = await getAllNotesByEntryId(entryId);
        if (notes.length) {
            return res.status(200).json(notes);
        } else {
            return res.status(404).json({ error: 'No notes found for this journal entry' });
        }
    } catch (err) {
        // Catch specific errors if available, otherwise fall back to a generic message
        res.status(500).json({
            error: 'An error occurred while fetching notes',
            details: err.message || err
        });
    }
};





// Create a new note for a journal entry
const createEntryNote = async (req, res) => {
    const { entryId } = req.params;
    try {
        const newNote = await createNote({ ...req.body, entry_id: entryId });
        res.status(201).json(newNote);
    } catch (err) {
        res.status(500).json({ error: 'An error occurred while creating the note', details: err });
    }
};

// Update a note
const updateEntryNote = async (req, res) => {
    const { entryId, noteId } = req.params; 
    try {
        const note = await getNoteById(noteId); 
        if (!note) {
            return res.status(404).json({ error: 'Note not found' });
        }

        if (note.entry_id !== parseInt(entryId, 10)) {
            return res.status(403).json({ error: 'Note does not belong to this entry' });
        }

        const updatedNote = await updateNote(noteId, req.body); 
        if (updatedNote) {
            return res.status(200).json(updatedNote); 
        } else {
            return res.status(404).json({ error: 'Note not found or could not be updated' });
        }
    } catch (err) {
        console.error('Error updating note:', err); 
        return res.status(500).json({ error: 'An error occurred while updating the note', details: err.message });
    }
};



// Delete a note
const deleteEntryNote = async (req, res) => {
    const { entryId, noteId } = req.params; 
    try {
        const note = await getNoteById(noteId); 
        if (!note) {
            return res.status(404).json({ error: 'Note not found' });
        }

        if (note.entry_id !== parseInt(entryId, 10)) {
            return res.status(403).json({ error: 'Note does not belong to this entry' });
        }

        const deletedNote = await deleteNote(entryId, noteId); 
        if (deletedNote.rowCount > 0) {
            res.status(200).json({ message: 'Note deleted successfully' }); 
            res.status(404).json({ error: 'Note not found or does not belong to this entry' });
        }
    } catch (err) {
        res.status(500).json({ error: 'An error occurred while deleting the note', details: err.message });
    }
};


// Get a specific note by its ID
const getOneNoteById = async (req, res) => {
    const { entryId, noteId } = req.params;
    try {
        const note = await getNoteById(noteId); 
        if (note) {
            if (note.entry_id === parseInt(entryId, 10)) {
                return res.status(200).json(note);
            } else {
                return res.status(403).json({ error: 'Note does not belong to this entry' });
            }
        } else {
            res.status(404).json({ error: 'Note not found' });
        }
    } catch (err) {
        console.error('Error fetching note:', err);
        res.status(500).json({ error: 'An error occurred while fetching the note', details: err.message });
    }
};


module.exports = {
    getAllNotes,
    createEntryNote,
    updateEntryNote,
    deleteEntryNote,
    getOneNoteById
};
