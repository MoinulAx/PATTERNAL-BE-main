const db = require('../db/dbConfig');



// Function to get the count of likes for a specific forum entry
const getLikesCountForForumEntry = async (forumEntryId) => {
    const query = `
        SELECT COUNT(*) AS likes_count
        FROM forum_likes
        WHERE forum_entry_id = $1
    `;
    const result = await db.one(query, [forumEntryId]);
    return result.likes_count;
};

// Function to get the likes objects for a specific forum entry
const getLikesForForumEntry = async (forumEntryId) => {
    const query = `
        SELECT *
        FROM forum_likes
        WHERE forum_entry_id = $1
    `;
    const result = await db.any(query, [forumEntryId]);
    return result;
};

// Function to create a like for a specific forum entry
const createLikeForForumEntry = async (userId, forumEntryId) => {
    const query = `
        INSERT INTO forum_likes (user_id, forum_entry_id)
        VALUES ($1, $2)
        ON CONFLICT (user_id, forum_entry_id) DO NOTHING
        RETURNING *
    `;
    const result = await db.oneOrNone(query, [userId, forumEntryId]);
    return result ? { message: 'Like added successfully' } : { message: 'Already liked' };
};

// Function to remove a like for a specific forum entry
const removeLikeForForumEntry = async (userId, forumEntryId) => {
    const query = `
        DELETE FROM forum_likes
        WHERE user_id = $1 AND forum_entry_id = $2
    `;
    await db.none(query, [userId, forumEntryId]);
    return { message: 'Like removed successfully' };
};


module.exports = {
    getLikesCountForForumEntry,
    getLikesForForumEntry,
    createLikeForForumEntry,
    removeLikeForForumEntry
};

