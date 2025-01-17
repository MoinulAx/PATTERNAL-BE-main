const express = require('express');
const app = express();
const cors = require('cors');
const axios = require('axios');

// Import routes
const meditationSessionsRoutes = require('./routes/meditationSessionsRoutes');
// const fatherActivityLogsRoutes = require('./routes/fatherActivityLogs');
const resourcesRoutes = require('./routes/resourcesRoutes');
const userRoutes = require('./routes/userRoutes');
const forumCategoriesRoutes = require('./routes/forumCategoriesRoutes')
// Middleware
app.use(express.json());  
app.use(cors());  





// Routes
// app.use('/meditation-sessions', meditationSessionsRoutes); 
// app.use('/father-activity-logs', fatherActivityLogsRoutes);  // Father activity logs routes
app.use('/resources', resourcesRoutes);  
app.use('/users', userRoutes); 
app.use('/forums', forumCategoriesRoutes)

// Home route for testing purposes
app.get('/', (req, res) => {
    res.send('Welcome to the Patternal App API');
});


// Error handling middleware
app.use((err, req, res, next) => {
    console.error(err.stack);
    res.status(500).send('Something went wrong!');
});

// Catch-all route for invalid URLs
app.get('*', (req, res) => {
    res.send("Invalid URL");
});



  
  
module.exports = app;
