const express = require('express');
const {
    likePost,
    unlikePost,
    fetchLikes
} = require('../controllers/commentLikesController');

const router = express.Router({ mergeParams: true }); 

// Route to like a comment
router.post('/', likePost);

// Route to unlike a comment
router.delete('/', unlikePost);

// Route to fetch likes for a specific comment
router.get('/', fetchLikes);

module.exports = router;
