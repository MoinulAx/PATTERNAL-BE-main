const journalResponsesQueries = require('../queries/journalResponses'); 

// Get all responses for a specific journal question
const getAllResponsesForQuestion = async (req, res) => {
    const { questionId } = req.params; 
    try {
        const responses = await journalResponsesQueries.getAllResponsesForQuestion(questionId);
        if (responses) {
            res.status(200).json(responses);
        } else {
            res.status(404).json({ message: 'No responses found for this question' });
        }
    } catch (error) {
        console.error('Error fetching responses:', error);
        res.status(500).json({ message: 'Error fetching responses', error });
    }
};

const createJournalResponse = async (req, res) => {
    const { questionId } = req.params; 
    const { response_text } = req.body; 
    if (!response_text) {
        return res.status(400).json({ message: "Response text is required" });
    }

    try {
        const newResponse = await journalResponsesQueries.createJournalResponse(questionId, response_text);
        res.status(201).json(newResponse);
    } catch (error) {
        console.error('Error creating response:', error);
        res.status(500).json({ message: 'Error creating response', error });
    }
};


// Update a specific journal response
const updateJournalResponse = async (req, res) => {
    const { id } = req.params; 
    const { response_text } = req.body; 

    // Ensure response_text is provided
    if (!response_text) {
        return res.status(400).json({ message: 'Response text is required' }); 
    }

    try {
        const updatedResponse = await journalResponsesQueries.updateJournalResponse(id, { response_text });
        
        if (updatedResponse) {
            return res.status(200).json(updatedResponse); 
        } else {
            return res.status(404).json({ message: 'Response not found' }); 
        }
    } catch (error) {
        console.error('Error updating response:', error); 
        res.status(500).json({ message: 'Error updating response', error });
    }
};


// Delete a specific journal response
const deleteJournalResponse = async (req, res) => {
    const { id } = req.params;
    try {
        const deletedResponse = await journalResponsesQueries.deleteJournalResponse(id);
        if (deletedResponse) {
            res.status(200).json({ message: 'Response deleted' });
        } else {
            res.status(404).json({ message: 'Response not found' });
        }
    } catch (error) {
        console.error('Error deleting response:', error);
        res.status(500).json({ message: 'Error deleting response', error });
    }
};

const getOneResponseController = async (req, res) => {
    const { id } = req.params; 
    try {
        const response = await journalResponsesQueries.getOneResponse(id);
        if (response) {
            return res.status(200).json(response); 
        } else {
            return res.status(404).json({ message: 'Response not found' }); 
        }
    } catch (err) {
        console.error('Error in controller:', err);
        return res.status(500).json({ error: 'Internal server error' }); 
    }
}
module.exports = {
    getAllResponsesForQuestion,
    createJournalResponse,
    updateJournalResponse,
    deleteJournalResponse,
    getOneResponseController
};
