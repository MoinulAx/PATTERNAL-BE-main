const request = require('supertest');
const app = require('../app'); 
const db = require('../db/dbConfig'); 

describe('Forum Entry API Tests', () => {
    let categoryId = 3; 
    let entryId; // For storing entry ID for testing DELETE and GET

    // Before all tests, clear any existing data or setup test data
    beforeAll(async () => {
        await db.none('TRUNCATE forum_entry CASCADE;'); // Clear existing entries
        await db.none('TRUNCATE forum_categories CASCADE;'); // Clear existing categories

        // Setup test data for forum categories
        await db.none(`INSERT INTO forum_categories (name, description) VALUES
            ('Fatherhood Journey', 'Share experiences, challenges, and joys of being a father'),
            ('Mental Health Support', 'A safe space to discuss mental health struggles and seek support'),
            ('Men’s Health & Wellness', 'Tips and discussions on physical and mental health for men')
        `);
    });

    test('POST /forums/:category_id/forum-entry/ should create a new forum entry', async () => {
        const response = await request(app)
            .post(`/forums/${categoryId}/forum-entry/`)
            .send({
                entry: "This is a new forum entry",
                user_id: 1 // Change this according to your test user ID
            });

        expect(response.statusCode).toBe(201);
        expect(response.body).toHaveProperty('id'); // Assuming the response contains the new entry ID
        expect(response.body.entry).toBe("This is a new forum entry");
        entryId = response.body.id; // Save the entry ID for later tests
    });

    test('GET /forums/:category_id/forum-entry/ should return all entries for the category', async () => {
        const response = await request(app)
            .get(`/forums/${categoryId}/forum-entry/`);

        expect(response.statusCode).toBe(200);
        expect(Array.isArray(response.body)).toBe(true); // Check if the response is an array
        expect(response.body.length).toBeGreaterThan(0); // Ensure there are entries
    });

    test('GET /forums/:category_id/forum-entry/:id should return a single entry', async () => {
        const response = await request(app)
            .get(`/forums/${categoryId}/forum-entry/${entryId}`);

        expect(response.statusCode).toBe(200);
        expect(response.body).toHaveProperty('id', entryId); // Verify it returns the correct entry
    });

    test('DELETE /forums/:category_id/forum-entry/:id should delete an entry', async () => {
        const response = await request(app)
            .delete(`/forums/${categoryId}/forum-entry/${entryId}`);

        expect(response.statusCode).toBe(200);
        expect(response.body).toEqual({ message: 'Forum entry deleted successfully' }); // Adjust according to your response
    });

    test('GET /forums/:category_id/forum-entry/:id should return 404 for deleted entry', async () => {
        const response = await request(app)
            .get(`/forums/${categoryId}/forum-entry/${entryId}`);

        expect(response.statusCode).toBe(404); // Should return 404 since entry is deleted
    });

    // After all tests, you can clear the database or leave it as is for manual inspection
    afterAll(async () => {
        await db.none('TRUNCATE forum_entry CASCADE;');
        await db.none('TRUNCATE forum_categories CASCADE;');
    });
});
