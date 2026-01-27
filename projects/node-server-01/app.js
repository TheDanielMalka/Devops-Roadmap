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


const infrastructure = [
    { id: 1, name: "Web-Server-01", status: "Running", region: "us-east-1" },
    { id: 2, name: "DB-Server-Master", status: "Running", region: "eu-central-1" },
    { id: 3, name: "Jenkins-Agent-01", status: "Stopped", region: "us-west-2" }
];

app.get('/', (req, res) => {
    res.send('Server is Up and Running!');
});

app.get('/api/v1/infrastructure', (req, res) => {
    res.json({
        total: infrastructure.length,
        data: infrastructure
    });
});

app.listen(PORT, () => {
    console.log(`Servvvvv is running on http://localhost:${PORT}`);
});