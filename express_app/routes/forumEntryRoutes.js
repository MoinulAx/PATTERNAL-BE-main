const express = require('express');
const router = express.Router({ mergeParams: true }); 
const forumEntryController = require('../controllers/forumEntryController');
const  forumComments = require('./commentRoutes')
const forumLikes = require('./forumLikesRouter')
// Get all forum entries by category ID
router.get('/', forumEntryController.getForumEntriesByCategory);

      
// Get a single forum entry by ID within a specific category
router.get('/:id', forumEntryController.getForumEntry);

// Create a new forum entry in a specific category
router.post('/', forumEntryController.createForumEntry);

// Update a forum entry (restricted to owner) within a specific category
router.put('/:id', forumEntryController.updateForumEntry);

// Delete a forum entry (restricted to owner) within a specific category
router.delete('/:id', forumEntryController.deleteForumEntry);

router.use('/:entryId/comments', (req, res, next) => {
    console.log('Forum-Entry ID from the request:', req.params.entryId);
    next()
}, forumComments);

router.use('/:forumEntryId/forum-likes', (req, res, next) => {
    console.log('Forum-Entry ID likes from the request:', req.params.forumEntryId);
    next()
}, forumLikes);

module.exports = router;
