// commentController.js
const {
    getAllCommentsByEntryId,
    getCommentById,
    createCommentForEntry,
    deleteCommentById
} = require('../queries/commentQueries');

// Get all comments for a specific forum entry
const getCommentsByEntry = async (req, res) => {
    const { entryId } = req.params;
    try {
        const comments = await getAllCommentsByEntryId(entryId);
        
        // Check if the result contains an error
        if (comments.error) {
            return res.status(404).json({ error: comments.error });
        }
        
        res.status(200).json(comments);
    } catch (err) {
        res.status(500).json({ error: 'An error occurred while fetching comments', details: err });
    }
};

// Get a specific comment by ID and check if it's part of the specified forum entry
const getSingleComment = async (req, res) => {
    const { commentId, entryId } = req.params; 
    try {
        // Fetch the comment by its ID
        const comment = await getCommentById(commentId,entryId);
        
        if (comment && comment.entry_id === parseInt(entryId)) { 
            res.status(200).json(comment);
        } else if (!comment) {
            res.status(404).json({ error: 'Comment not found' });
        } else {
            res.status(404).json({ error: 'Comment does not belong to this forum entry' });
        }
    } catch (err) {
        res.status(500).json({ error: 'An error occurred while fetching the comment', details: err.message });
    }
};

// Create a new comment for a specific forum entry
const createComment = async (req, res) => {
    try {
        const newComment = await createCommentForEntry(req.body);
        res.status(201).json(newComment);
    } catch (err) {
        res.status(500).json({ error: 'An error occurred while creating the comment', details: err });
    }
};

// Delete a comment by ID for a specific forum entry
const deleteComment = async (req, res) => {
    const { commentId, entryId } = req.params;

    try {
        const result = await deleteCommentById(commentId, entryId);
        
        if (result.rowCount === 0) {
            return res.status(404).json({ error: 'Comment not found or does not belong to this entry' });
        }

        res.status(200).json({ message: 'Comment deleted successfully' });
    } catch (err) {
        res.status(500).json({ error: 'An error occurred while deleting the comment', details: err.message });
    }
};
module.exports = {
    getCommentsByEntry,
    getSingleComment,
    createComment,
    deleteComment
};
