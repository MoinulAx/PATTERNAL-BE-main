const { addLike, removeLike, getLikes } = require('../queries/commentlikequeries');

const likePost = async (req, res) => {
    const { commentId } = req.params;
    const { userId } = req.body;

    try {
        const result = await addLike(userId, commentId);
        res.status(201).json(result);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};

const unlikePost = async (req, res) => {
    const { commentId } = req.params;
    const { userId } = req.body;

    try {
        const result = await removeLike(userId, commentId);
        res.status(200).json(result);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};

const fetchLikes = async (req, res) => {
    const { commentId } = req.params;

    try {
        const likes = await getLikes(commentId);
        res.status(200).json(likes);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};

module.exports = {
    likePost,
    unlikePost,
    fetchLikes
};
