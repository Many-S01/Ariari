const express = require('express');
const router = express.Router();

// GET /api/questions
router.get('/questions', (req, res) => {
  res.json({ message: "This will return economic questions" });
});

// POST /api/ask
router.post('/ask', (req, res) => {
  res.json({ message: "This will handle economic questions" });
});

// GET /api/goals
router.get('/goals', (req, res) => {
  res.json({ message: "This will return economic goals" });
});

// POST /api/goals
router.post('/goals', (req, res) => {
  res.json({ message: "This will create a new economic goal" });
});

module.exports = router;