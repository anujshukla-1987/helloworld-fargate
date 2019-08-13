var express = require('express');

var mysql = require('mysql');

var connection = mysql.createConnection({
  host     : "mydatabase.cux5hwsmbyzf.us-east-1.rds.amazonaws.com",
  user     : "adminuser",
  password : "adminpassword",
  port     : "3306"
});

connection.connect(function(err) {
  if (err) {
    console.error('Database connection failed: ' + err.stack);
    return;
  }

  console.log('Connected to database.');
});

connection.end();

var app = express();


app.listen(3000, () => console.log('API listening on port 3000!'))

app.get('/', function (req, res) {
    res.send({
        "status": "Good"
    })
});

module.exports = app;
