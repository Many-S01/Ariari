const { Configuration, OpenAIApi } = require('openai');
const csvService = require('./csv_service');

const configuration = new Configuration({
  apiKey: process.env.OPENAI_API_KEY,
});
const openai = new OpenAIApi(configuration);

exports.loadQuestions = async () => {
  try {
    const questions = await csvService.readQuestionsFromCSV();
    console.log(`Loaded ${questions.length} questions from CSV`);
    return questions;
  } catch (error) {
    console.error('Error loading questions:', error);
    throw new Error('Failed to load questions from CSV');
  }
};

exports.getAnswer = async (question) => {
  try {
    const response = await openai.createCompletion({
      model: "text-davinci-002",
      prompt: question,
      max_tokens: 150,
    });
    return response.data.choices[0].text.trim();
  } catch (error) {
    console.error('Error in OpenAI API call:', error);
    throw new Error('Failed to get answer from OpenAI');
  }
};