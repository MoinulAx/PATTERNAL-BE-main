const userQueries = require('../queries/userQueries'); 

// Get all users
const getAllUsers = async (req, res) => {
    try {
        const result = await userQueries.getAllUsersQuery();
        res.json(result);
    } catch (err) {
        console.error(err);
        res.status(500).send('Server error');
    }
};

// Get a single user by ID
const getUserById = async (req, res) => {
    const { id } = req.params;
    try {
        const result = await userQueries.getUserByIdQuery(id);
        if (!result || result.length === 0) {
            return res.status(404).send('User not found');
        }
        res.json(result[0]);
    } catch (err) {
        console.error(err);
        res.status(500).send('Server error');
    }
};

// Create a new user
const createUser = async (req, res) => {
    const { username, first_name, last_name, email, password, child_amount } = req.body;
    try {
        const result = await userQueries.createUserQuery(username, first_name, last_name, email, password, child_amount);
        res.status(201).json(result[0]);
    } catch (err) {
        console.error(err);
        res.status(500).send('Server error');
    }
};

const updateUser = async (req, res) => {
    const { id } = req.params;
    const updates = req.body; 
    console.log('updateUser called with:', updates);

    try {
        const result = await userQueries.updateUserQuery(id, updates);
        res.json(result);
    } catch (err) {
        console.error('Error updating user:', err);
        res.status(500).send('Server error');
    }
};


// Delete a user
const deleteUser = async (req, res) => {
    const { id } = req.params;
    try {
        const result = await userQueries.deleteUserQuery(id);
        if (result.length === 0) return res.status(404).send('User not found');
        res.send('User deleted');
    } catch (err) {
        console.error(err);
        res.status(500).send('Server error');
    }
};

const loginUser = async (req, res) => {
    const { email, password } = req.body;

    try {
        const user = await userQueries.getUserByEmailQuery(email);

        if (!user || user.length === 0) {
            return res.status(401).json({ message: 'Invalid email or password' });
        }

        if (user[0].password !== password) {  
            return res.status(401).json({ message: 'Invalid email or password' });
        }

        res.status(200).json({ message: 'Login successful', user: user[0] });
    } catch (err) {
        console.error(err);
        res.status(500).json({ message: 'Something went wrong' });
    }
};

// Export the controller functions
module.exports = {
    getAllUsers,
    getUserById,
    createUser,
    updateUser,
    deleteUser,
    loginUser
};
