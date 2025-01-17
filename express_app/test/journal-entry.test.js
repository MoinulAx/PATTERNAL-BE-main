const request = require('supertest');
const app = require('../app'); 
const { expect } = require('chai');

// Test object

const entry = {
    title: 'test title',
    content: 'test content',
    mood: 'test mood',
    notes: 'test note',
    user_id: 1
};

describe('Journal CRUD API', function () {
    let entryId;

    // CREATE: Test POST /journal_entry route
    it('should create a new journal entry', async function () {
        const res = await request(app)
            .post('/journal-entries')
            .send(entry)
            .expect(201);

    // Assert response structure and data
    expect(res.body).to.have.property('id');
    expect(res.body.title).to.equal(entry.title);
    expect(res.body.mood).to.equal(entry.mood);
    expect(res.body.notes).to.equal(entry.notes);
    expect(res.body.user_id).to.equal(1)

    entryId = res.body.id; 
    


    });
});

