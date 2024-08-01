const openaiService = require('../services/openai_service');

exports.askQuestion = async (req, res) => {
  try {
    const { question } = req.body;
    const answer = await openaiService.getAnswer(question);
    res.json({ answer });
  } catch (error) {
    console.error('Error in askQuestion:', error);
    res.status(500).json({ error: 'An error occurred while processing your request.' });
  }
};

exports.setEconomicGoal = async (req, res) => {
  try {
    const { goal } = req.body;
    // Here you would typically save the goal to a database
    res.json({ message: 'Goal set successfully', goal });
  } catch (error) {
    console.error('Error in setEconomicGoal:', error);
    res.status(500).json({ error: 'An error occurred while setting the goal.' });
  }
};

exports.getEconomicGoals = async (req, res) => {
  try {
    // Here you would typically fetch goals from a database
    const goals = [{ id: 1, description: 'Save $100 this month' }];
    res.json(goals);
  } catch (error) {
    console.error('Error in getEconomicGoals:', error);
    res.status(500).json({ error: 'An error occurred while fetching goals.' });
  }
};