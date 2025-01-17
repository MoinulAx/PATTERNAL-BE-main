const request = require('supertest')
const app = require('../app')
const {expect} = require('chai')

describe ('Paternal Backend App', () =>{
     it('Should get a basic welcome message GET /', (done) =>{
        request(app)
        .get('/')
        .expect(200)
        .end((error,response)=>{
            if (error) return done(error)
            expect(response.text).to.equal('Welcome to the Patternal App API')
            done()
        })
     })
})