const {
    getAllEntriesByCategory,
    getEntriesByUserIdInCategory,
    getEntryByIdInCategory,
    createEntryInCategory,
    updateEntryInCategory,
    deleteEntryInCategory
} = require('../queries/forumEntryQueries');

const getForumEntriesByCategory = async (req, res) => {
    const { category_id } = req.params;
    try {
        const entries = await getAllEntriesByCategory(category_id);
        res.status(200).json(entries);
    } catch (err) {
        res.status(500).json({ error: 'An error occurred while fetching forum entries', details: err });
    }
};

const getForumEntriesByUser = async (req, res) => {
    const { category_id, user_id } = req.params;
    try {
        const entries = await getEntriesByUserIdInCategory(user_id, category_id);
        res.status(200).json(entries);
    } catch (err) {
        res.status(500).json({ error: 'An error occurred while fetching forum entries', details: err });
    }
};

const getForumEntry = async (req, res) => {
    const { category_id, id } = req.params;
    try {
        const entry = await getEntryByIdInCategory(id, category_id);
        if (entry) {
            res.status(200).json(entry);
        } else {
            res.status(404).json({ error: 'Forum entry not found' });
        }
    } catch (err) {
        res.status(500).json({ error: 'An error occurred while fetching the forum entry', details: err });
    }
};

const createForumEntry = async (req, res) => {
    const { category_id } = req.params;
    try {
        const newEntry = await createEntryInCategory(req.body, category_id);
        res.status(201).json(newEntry);
    } catch (err) {
        res.status(500).json({ error: 'An error occurred while creating the forum entry', details: err });
    }
};

const updateForumEntry = async (req, res) => {
    const { category_id, id } = req.params;
    try {
        const updatedEntry = await updateEntryInCategory(id, req.body, category_id);
        if (updatedEntry) {
            res.status(200).json(updatedEntry);
        } else {
            res.status(404).json({ error: 'Forum entry not found or could not be updated' });
        }
    } catch (err) {
        res.status(500).json({ error: 'An error occurred while updating the forum entry', details: err });
    }
};

const deleteForumEntry = async (req, res) => {
    const { category_id, id } = req.params;
    try {
        const deleted = await deleteEntryInCategory(id, category_id);
        if (deleted.rowCount > 0) {
            res.status(200).json({ message: 'Forum entry deleted successfully' });
        } else {
            res.status(404).json({ error: 'Forum entry not found or could not be deleted' });
        }
    } catch (err) {
        res.status(500).json({ error: 'An error occurred while deleting the forum entry', details: err });
    }
};

// Exporting the functions using module.exports
module.exports = {
    getForumEntriesByCategory,
    getForumEntriesByUser,
    getForumEntry,
    createForumEntry,
    updateForumEntry,
    deleteForumEntry
};
