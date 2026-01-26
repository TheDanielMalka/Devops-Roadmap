require('dotenv').config();
const express = require('express');
const app = express();
const PORT = process.env.PORT || 5000;

app.get('/', (req, res) => {
    res.send('Server is Up and Running with ENV!');
});

app.listen(PORT, () => {
    console.log(`Servvvvv is running on http://localhost:${PORT}`);
});