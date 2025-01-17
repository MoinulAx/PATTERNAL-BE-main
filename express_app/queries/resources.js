// queries/resources.js
const db = require('../db/dbConfig');

// Get all resources
const getAllResources = async () => {
    try {
        const allResources = await db.any('SELECT * FROM resources');
        return allResources;
    } catch (err) {
        return err;
    }
};

// Get a single resource by ID
const getResourceById = async (id) => {
    try {
        const resource = await db.oneOrNone('SELECT * FROM resources WHERE id = $1', id);
        return resource;
    } catch (err) {
        return err;
    }
};

// Create a new resource
const createResource = async (resource) => {
    try {
        const newResource = await db.one(
            'INSERT INTO resources (title, url, resource_type, description, created_at) VALUES ($1, $2, $3, $4, now()) RETURNING *',
            [resource.title, resource.url, resource.resource_type, resource.description]
        );
        return newResource;
    } catch (err) {
        return err;
    }
};

// Update a resource
const updateResource = async (id, resource) => {
    try {
        const updatedResource = await db.one(
            'UPDATE resources SET title = $1, url = $2, resource_type = $3, description = $4 WHERE id = $5 RETURNING *',
            [resource.title, resource.url, resource.resource_type, resource.description, id]
        );
        return updatedResource;
    } catch (err) {
        return err;
    }
};

// Delete a resource
const deleteResource = async (id) => {
    try {
        const deletedResource = await db.oneOrNone('DELETE FROM resources WHERE id = $1 RETURNING *', id);
        return deletedResource;
    } catch (err) {
        return err;
    }
};

module.exports = {
    getAllResources,
    getResourceById,
    createResource,
    updateResource,
    deleteResource
};
