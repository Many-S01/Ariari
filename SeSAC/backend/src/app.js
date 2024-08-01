require('dotenv').config();
const express = require('express');
const cors = require('cors');
const economicRoutes = require('./routes/economic_routes');

const app = express();

app.use(cors());
app.use(express.json());

app.use('/api', economicRoutes);

app.use((err, req, res, next) => {
  console.error(err.stack);
  res.status(500).send('Something broke!');
});

module.exports = app;