const http = require('http');
const fs = require('fs');
const path = require('path');
const mysql = require('mysql2');


// Define the hostname and port
const hostname = '10.0.0.16';
const port = 8080;

const db = mysql.createConnection({
        host:'localhost',
        user:'root',
        password:'eliyan1012',
        database:'test',
});
//finish here
db.connect((err) => {
  if (err) {
    console.error('Error connecting to the database:', err.stack);
    return;
  }
  console.log('Connected to the database as id ' + db.threadId);
});


// Create an HTTP server
const server = http.createServer((req, res) => {
  // Handle requests for the root URL
  res.setHeader('Access-Control-Allow-Origin', '*');
  res.setHeader('Access-Control-Allow-Methods', 'GET, POST, OPTIONS');
  res.setHeader('Access-Control-Allow-Headers', 'Content-Type');
  if (req.url === '/') {
    // Serve index.html
    fs.readFile(path.join(__dirname, 'index.html'), 'utf8', (err, data) => {
      if (err) {
        res.statusCode = 500;
        res.end('Internal Server Error');
        return;
      }
      res.statusCode = 200;
      res.setHeader('Content-Type', 'text/html');
      res.end(data);
    });
  } else if (req.url.startsWith('/styles/') && path.extname(req.url) === '.css') {
    const filePath = path.join(__dirname, req.url);
    fs.readFile(filePath, 'utf8', (err, data) => {
      if (err) {
        res.statusCode = 404;
        res.end('Not Found');
        return;
      }
      res.statusCode = 200;
      res.setHeader('Content-Type', 'text/css');
      res.end(data);
    });
  } else if (req.url.startsWith('/scripts/') && path.extname(req.url) === '.js') {
    const filePath = path.join(__dirname, req.url);
    fs.readFile(filePath, 'utf8', (err, data) => {
      if (err) {
        res.statusCode = 404;
        res.end('Not Found');
        return;
      }
      res.statusCode = 200;
      res.setHeader('Content-Type', 'application/javascript');
      res.end(data);
    });
  } else if (req.url.startsWith('/sources/Fonts/Revalia/') && path.extname(req.url) === '.ttf') {
    const filePath = path.join(__dirname, req.url);
    fs.readFile(filePath, (err, data) => {
      if (err) {
        res.statusCode = 404;
        res.end('Not Found');
        return;
      }
      res.statusCode = 200;
      res.setHeader('Content-Type', 'font/ttf');
      res.end(data);
    });
  } else if (req.url === '/submit-message' && req.method === 'POST') {
    let body = '';

    req.on('data', chunk => {
        body += chunk.toString();
    });

    req.on('end', () => {
        try {
            const messageData = JSON.parse(body);
            const message = messageData.message; // Ensure this key matches the client request

            const query = 'INSERT INTO test (msg) VALUES (?)'; // Use the correct column name 'msg'
            db.query(query, [message], (err, result) => {
                if (err) {
                    res.statusCode = 500;
                    res.end('Internal Server Error');
                    return;
                }
                res.statusCode = 200;
                res.setHeader('Content-Type', 'application/json');
                res.end(JSON.stringify({ success: true, messageId: result.insertId }));
            });
        } catch (error) {
            res.statusCode = 400;
            res.end('Bad Request');
        }
    });
  } else {
        res.statusCode = 404;
        res.setHeader('Content-Type', 'application/json');
        res.end(JSON.stringify({ error: 'Not Found' }));  }
  });

// Make the server listen on the defined port and hostname
server.listen(port, hostname, () => {
  console.log(`Server running at http://${hostname}:${port}/`);
});
