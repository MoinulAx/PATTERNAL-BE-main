// routes/resources.js
const express = require('express');
const router = express.Router();
const {
    getAllRes,
    getOneRes,
    createRes,
    updateRes,
    deleteRes
} = require('../controllers/resourcesController');

// Get all resources
router.get('/', getAllRes);

// Get one resource by ID
router.get('/:id', getOneRes);

// Create a new resource
router.post('/', createRes);

// Update an existing resource
router.put('/:id', updateRes);

// Delete a resource
router.delete('/:id', deleteRes);

module.exports = router;
