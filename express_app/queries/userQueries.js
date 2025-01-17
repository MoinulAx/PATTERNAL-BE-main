const db = require('../db/dbConfig');

// Queries
const getAllUsersQuery = async () => {
    return db.any('SELECT * FROM users');
};

const getUserByIdQuery = async (id) => {
    return db.query('SELECT * FROM users WHERE id = $1', [id]);
};

const createUserQuery = async (username, first_name, last_name, email, password, child_amount) => {
    return db.query(
        'INSERT INTO users (username, first_name, last_name, email, password, child_amount, created_at, updated_at) VALUES ($1, $2, $3, $4, $5, $6, NOW(), NOW()) RETURNING *',
        [username, first_name, last_name, email, password, child_amount]
    );
};
const updateUserQuery = async (id, updates) => {
    const { username, first_name, last_name, email, password, child_amount, meditation_streak, meditation_status } = updates;

    const query = `
        UPDATE users
        SET 
            username = COALESCE($1, username),
            first_name = COALESCE($2, first_name),
            last_name = COALESCE($3, last_name),
            email = COALESCE($4, email),
            password = COALESCE($5, password),
            child_amount = COALESCE($6, child_amount),
            meditation_streak = COALESCE($7, meditation_streak),
            meditation_status = COALESCE($8, meditation_status),
            updated_at = NOW()
        WHERE id = $9
        RETURNING *;
    `;

    return db.one(query, [username, first_name, last_name, email, password, child_amount, meditation_streak, meditation_status, id]);
};


const deleteUserQuery = async (id) => {
    return db.query('DELETE FROM users WHERE id = $1 RETURNING *', [id]);
};

const getUserByEmailQuery = async (email) => {
    return db.query('SELECT * FROM users WHERE email = $1', [email]);
};


// Export queries
module.exports = {
    getAllUsersQuery,
    getUserByIdQuery,
    createUserQuery,
    updateUserQuery,
    deleteUserQuery,
    getUserByEmailQuery
};
