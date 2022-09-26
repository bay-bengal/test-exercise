const https = require('https');
const fs = require('fs');

const express = require('express')
const app = express()

const options = {
    key: fs.readFileSync("localhost-key.pem"),
    cert: fs.readFileSync("localhost.pem"),
  };

  app.use((req, res, next) => {
    res.send('<h1>HTTPS is working!</h1>');
  });
  
  const port = 5000;
  
  https.createServer(options, app).listen(port, () => {
    console.log('Server listening on port ' + port);
  });


/* app.get('/', (req, res) => res.send('Hello World!'))
app.listen(3000, () => console.log('Server ready')) */