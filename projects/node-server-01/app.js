require('dotenv').config();
const express = require('express');
const app = express();
const PORT = process.env.PORT || 5000;


app.use((req, res, next) => {
    const time = new Date().toLocaleString();
    console.log(`[${time}] ${req.method} request to: ${req.url}`);

    if (req.query.admin === 'true') {
        console.log("⚠️ Access Control: Admin authorized.");
        next();
    } else {
        console.log("🚫 Access Control: Unauthorized attempt blocked.");
        res.status(403).send('<h1>403 Forbidden</h1><p>You need admin privileges to access this server.</p>');
    }
});

app.get('/', (req, res) => {
    res.send('Server is Up and Running with ENV!');
});

app.listen(PORT, () => {
    console.log(`Servvvvv is running on http://localhost:${PORT}`);
});