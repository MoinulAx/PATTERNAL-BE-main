const db = require('../db/dbConfig');

const getAllEntriesByCategory = async (categoryId) => {
    return db.any('SELECT * FROM forum_entry WHERE category_id = $1', [categoryId]);
};

const getEntriesByUserIdInCategory = async (userId, categoryId) => {
    return db.any('SELECT * FROM forum_entry WHERE user_id = $1 AND category_id = $2', [userId, categoryId]);
};

const getEntryByIdInCategory = async (id, categoryId) => {
    return db.oneOrNone('SELECT * FROM forum_entry WHERE id = $1 AND category_id = $2', [id, categoryId]);
};

const createEntryInCategory = async (entryData, categoryId) => {
    return db.one(
        'INSERT INTO forum_entry (entry, category_id, user_id) VALUES ($1, $2, $3) RETURNING *',
        [entryData.entry, categoryId, entryData.user_id]
    );
};

const updateEntryInCategory = async (id, entryData, categoryId) => {
    return db.oneOrNone(
        'UPDATE forum_entry SET entry = $1 WHERE id = $2 AND category_id = $3 RETURNING *',
        [entryData.entry, id, categoryId]
    );
};

const deleteEntryInCategory = async (id, categoryId) => {
    return db.result('DELETE FROM forum_entry WHERE id = $1 AND category_id = $2', [id, categoryId]);
};

// Exporting the functions using module.exports
module.exports = {
    getAllEntriesByCategory,
    getEntriesByUserIdInCategory,
    getEntryByIdInCategory,
    createEntryInCategory,
    updateEntryInCategory,
    deleteEntryInCategory
};
