// forumLikesRouter.js

const express = require('express');
const router = express.Router({ mergeParams: true }); 
const forumLikesController = require('../controllers/forumLikesController');



// Route to get the likes objects for a specific forum entry
router.get('/', forumLikesController.getLikesForEntry);

// Route to get the count of likes for a specific forum entry
router.get('/count', forumLikesController.getLikesCountForEntry);

router.post('/', forumLikesController.addLikeToEntry);

router.delete('/', forumLikesController.removeLikeFromEntry);

module.exports = router;
