// commentQueries.js
const db = require('../db/dbConfig');

// Get all comments for a specific forum entry
const getAllCommentsByEntryId = async (entryId) => {
    if (!entryId) {
        throw new Error('entryId is required');
    }

    try {
        const comments = await db.any('SELECT * FROM comments WHERE entry_id = $1', [entryId]);
        
        // Check if there are no comments for the specified entry
        if (comments.length === 0) {
            throw new Error('No comments found for this entry.');
        }

        return comments;
    } catch (error) {
        // Re-throw the error for the controller to handle
        throw new Error(`An error occurred while fetching comments: ${error.message}`);
    }
};


// Get a specific comment by ID and check if it belongs to a specific forum entry
const getCommentById = async (commentId, entryId) => {
    return db.oneOrNone('SELECT * FROM comments WHERE id = $1 AND entry_id = $2', [commentId, entryId]);
};


// Create a new comment for a specific forum entry
const createCommentForEntry = async (commentData) => {
    return db.one(
        'INSERT INTO comments (entry_id, user_id, comment) VALUES ($1, $2, $3) RETURNING *',
        [commentData.entry_id, commentData.user_id, commentData.comment]
    );
};
// Delete a comment by ID for a specific forum entry
const deleteCommentById = async (commentId, entryId) => {
    return db.result(
        'DELETE FROM comments WHERE id = $1 AND entry_id = $2',
        [commentId, entryId]
    );
}

module.exports = {
    getAllCommentsByEntryId,
    getCommentById,
    createCommentForEntry,
    deleteCommentById
};
