// controllers/resourcesController.js
const {
    getAllResources,
    getResourceById,
    createResource,
    updateResource,
    deleteResource
} = require('../queries/resources');

// Get all resources
const getAllRes = async (req, res) => {
    
    const resources = await getAllResources();
    if (resources.length) {
        res.status(200).json(resources);
    } else {
        res.status(500).json({ error: 'No resources found' });
    }
};

// Get one resource by ID
const getOneRes = async (req, res) => {
    const { id } = req.params;
    const resource = await getResourceById(id);
    if (resource) {
        res.status(200).json(resource);
    } else {
        res.status(404).json({ error: 'Resource not found' });
    }
};

// Create a new resource
const createRes = async (req, res) => {
    const newResource = await createResource(req.body);
    res.status(201).json(newResource);
};

// Update a resource
const updateRes = async (req, res) => {
    const { id } = req.params;
    const updatedResource = await updateResource(id, req.body);
    res.status(200).json(updatedResource);
};

// Delete a resource
const deleteRes = async (req, res) => {
    const { id } = req.params;
    const deletedResource = await deleteResource(id);
    res.status(200).json(deletedResource);
};

module.exports = {
    getAllRes,
    getOneRes,
    createRes,
    updateRes,
    deleteRes
};
