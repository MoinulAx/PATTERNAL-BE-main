const express = require('express');
const router = express.Router({ mergeParams: true });
const userController = require('../controllers/userController');
const journalEntriesRoutes = require('./journalEntriesRoutes')

// Routes for users
router.get('/', userController.getAllUsers);
router.get('/:id', userController.getUserById);
router.put('/:id', userController.updateUser);
router.delete('/:id', userController.deleteUser);


router.post('/', userController.createUser);
router.post('/login', userController.loginUser);

router.use('/:userId/journal-entries', (req, res, next) => {
    console.log('Entry ID from the request:', req.params.entryId);
    next(); 
}, journalEntriesRoutes);

module.exports = router;
