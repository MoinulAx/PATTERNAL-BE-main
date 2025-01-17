const express = require('express');
const {
    getCommentsByEntry,
    getSingleComment,
    createComment,
    deleteComment
} = require('../controllers/commentController');
const router = express.Router({ mergeParams: true }); 
const commentsLikesRoutes = require('./commentlLikesRoutes')

// Define the routes
router.get('/', getCommentsByEntry);  
router.get('/:commentId', getSingleComment);                
router.post('/', createComment); 
router.delete('/:commentId',deleteComment)    

router.use('/:commentId/comments-likes', (req, res, next) => {
    console.log('Forum-Entry ID likes from the request:', req.params.commentId);
    next()
}, commentsLikesRoutes);

module.exports = router;
