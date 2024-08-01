const fs = require('fs');
const csv = require('csv-parser');
const path = require('path');
const createCsvWriter = require('csv-writer').createObjectCsvWriter;

const questionsFilePath = path.join(__dirname, '../../data/economic_questions.csv');
const goalsFilePath = path.join(__dirname, '../../data/economic_goals.csv');

exports.readQuestionsFromCSV = () => {
  return new Promise((resolve, reject) => {
    const questions = [];
    fs.createReadStream(questionsFilePath)
      .pipe(csv())
      .on('data', (row) => {
        questions.push({
          id: row.id,
          question: row.question,
          answer: row.answer
        });
      })
      .on('end', () => {
        console.log('Questions CSV file successfully processed');
        resolve(questions);
      })
      .on('error', (error) => {
        reject(error);
      });
  });
};

exports.readGoalsFromCSV = () => {
  return new Promise((resolve, reject) => {
    const goals = [];
    fs.createReadStream(goalsFilePath)
      .pipe(csv())
      .on('data', (row) => {
        goals.push({
          id: row.id,
          description: row.description,
          isCompleted: row.isCompleted === 'true'
        });
      })
      .on('end', () => {
        console.log('Goals CSV file successfully processed');
        resolve(goals);
      })
      .on('error', (error) => {
        reject(error);
      });
  });
};

exports.writeGoalsToCSV = (goals) => {
  const csvWriter = createCsvWriter({
    path: goalsFilePath,
    header: [
      {id: 'id', title: 'id'},
      {id: 'description', title: 'description'},
      {id: 'isCompleted', title: 'isCompleted'}
    ]
  });

  return csvWriter.writeRecords(goals)
    .then(() => console.log('Goals CSV file was written successfully'));
};