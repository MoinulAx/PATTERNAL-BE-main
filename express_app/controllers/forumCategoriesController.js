const { getAllCategories, createCategory, getCategoryById, updateCategory, deleteCategory } = require('../queries/forumCategoriesQueries');

// Get all categories
const getForumEntriesByCategory = async (req, res) => {
    const { category_id } = req.params; 
    try {
        const entries = await getAllCategories(category_id); // Call your query function
        res.status(200).json(entries);
    } catch (err) {
        res.status(500).json({ error: 'An error occurred while fetching forum entries', details: err });
    }
};


// Get category by ID
const getCategory = async (req, res) => {
    const { id } = req.params;
    try {
        const category = await getCategoryById(id);
        if (category) {
            res.status(200).json(category);
        } else {
            res.status(404).json({ error: 'Category not found' });
        }
    } catch (err) {
        res.status(500).json({ error: 'An error occurred while fetching the category', details: err });
    }
};

// Create a new category
const createForumCategory = async (req, res) => {
    try {
        const newCategory = await createCategory(req.body);
        res.status(201).json(newCategory);
    } catch (err) {
        res.status(500).json({ error: 'An error occurred while creating the category', details: err });
    }
};

// Update a category
const updateForumCategory = async (req, res) => {
    const { id } = req.params;
    try {
        const updatedCategory = await updateCategory(id, req.body);
        if (updatedCategory) {
            res.status(200).json(updatedCategory);
        } else {
            res.status(404).json({ error: 'Category not found' });
        }
    } catch (err) {
        res.status(500).json({ error: 'An error occurred while updating the category', details: err });
    }
};

// Delete a category
const deleteForumCategory = async (req, res) => {
    const { id } = req.params;
    try {
        const deleted = await deleteCategory(id);
        if (deleted) {
            res.status(200).json({ message: 'Category deleted successfully' });
        } else {
            res.status(404).json({ error: 'Category not found' });
        }
    } catch (err) {
        res.status(500).json({ error: 'An error occurred while deleting the category', details: err });
    }
};

module.exports = {
    getForumEntriesByCategory,
    createForumCategory,
    getCategory,
    updateForumCategory,
    deleteForumCategory
};
