const db = require('../db/dbConfig');

// Adds a like by inserting a row into comments_likes if it doesn’t already exist
const addLike = async (userId, commentId) => {
    const result = await db.none(
        `INSERT INTO comments_likes (user_id, comment_id)
         VALUES ($1, $2)
         ON CONFLICT DO NOTHING`, 
        [userId, commentId]
    );
    return { message: 'Liked successfully' };
};

// Removes a like by deleting a row from comments_likes
const removeLike = async (userId, commentId) => {
    await db.none(
        `DELETE FROM comments_likes
         WHERE user_id = $1 AND comment_id = $2`, 
        [userId, commentId]
    );
    return { message: 'Unliked successfully' };
};

// Retrieves all users who liked a specific comment
const getLikes = async (commentId) => {
    const likes = await db.manyOrNone(
        `SELECT user_id FROM comments_likes 
         WHERE comment_id = $1`, 
        [commentId]
    );
    return likes;
};

module.exports = {
    addLike,
    removeLike,
    getLikes
};
