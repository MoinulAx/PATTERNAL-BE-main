// forumLikesController.js

const forumLikesQueries = require('../queries/forumLikesQueries');

// Controller to handle getting the likes count for a specific forum entry
const getLikesCountForEntry = async (req, res) => {
    const { forumEntryId } = req.params;

    try {
        const likesCount = await forumLikesQueries.getLikesCountForForumEntry(forumEntryId);
        return res.status(200).json({ likesCount });
    } catch (error) {
        console.error('Error fetching likes count:', error);
        return res.status(500).json({ error: 'Internal server error' });
    }
};

const getLikesForEntry = async (req, res) => {
    const { forumEntryId } = req.params;

    try {
        console.log(`Fetching likes for forum entry ID: ${forumEntryId}`); // Log the forum entry ID
        const likes = await forumLikesQueries.getLikesForForumEntry(forumEntryId);
        return res.status(200).json(likes);
    } catch (error) {
        console.error('Error fetching likes:', error);
        return res.status(500).json({ error: 'Internal server error' });
    }
};

const addLikeToEntry = async (req, res) => {
    const { forumEntryId } = req.params;
    const { userId } = req.body;  

    try {
        const result = await forumLikesQueries.createLikeForForumEntry(userId, forumEntryId);
        return res.status(200).json(result);
    } catch (error) {
        console.error('Error adding like:', error);
        return res.status(500).json({ error: 'Internal server error' });
    }
};

const removeLikeFromEntry = async (req, res) => {
    const { forumEntryId } = req.params;
    const { userId } = req.body;

    try {
        const result = await forumLikesQueries.removeLikeForForumEntry(userId, forumEntryId);
        res.status(200).json(result);
    } catch (error) {
        console.error('Error removing like:', error);
        res.status(500).json({ error: 'Internal server error' });
    }
};


module.exports = {
    getLikesCountForEntry,
    getLikesForEntry,
    addLikeToEntry,
    removeLikeFromEntry
    
};
