const express = require('express');
const router = express.Router({ mergeParams: true }); 
const forumCategoriesController = require('../controllers/forumCategoriesController');
const forumEntryRoutes = require('./forumEntryRoutes')
// Get all forum categories
router.get('/', forumCategoriesController.getForumEntriesByCategory);

// Get a single category by ID
router.get('/:id', forumCategoriesController.getCategory);

// Create a new forum category
router.post('/', forumCategoriesController.createForumCategory);

// Update a forum category
router.put('/:id', forumCategoriesController.updateForumCategory);

// Delete a forum category
router.delete('/:id', forumCategoriesController.deleteForumCategory);

router.use('/:category_id/forum-entry', (req, res, next) => {
    console.log('Catergory ID from the request:', req.params.category_id);
    next()
}, forumEntryRoutes);

module.exports = router;
