const db = require('../db/dbConfig');

// Get all forum categories
const getAllCategories = async () => {
    return db.any('SELECT * FROM forum_categories');
};

// Get category by ID
const getCategoryById = async (id) => {
    return db.oneOrNone('SELECT * FROM forum_categories WHERE id = $1', [id]);
};

// Create a new forum category
const createCategory = async (categoryData) => {
    return db.one(
        'INSERT INTO forum_categories (name, description) VALUES ($1, $2) RETURNING *',
        [categoryData.name, categoryData.description]
    );
};

// Update a forum category
const updateCategory = async (id, categoryData) => {
    return db.oneOrNone(
        'UPDATE forum_categories SET name = $1, description = $2 WHERE id = $3 RETURNING *',
        [categoryData.name, categoryData.description, id]
    );
};

// Delete a forum category
const deleteCategory = async (id) => {
    return db.result('DELETE FROM forum_categories WHERE id = $1', [id]);
};

module.exports = {
    getAllCategories,
    getCategoryById,
    createCategory,
    updateCategory,
    deleteCategory
};
