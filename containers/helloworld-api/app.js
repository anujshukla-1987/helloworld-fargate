var express = require('express');

var mysql = require('mysql');

let status = "";

let dbhost = process.env.DbHost;

var connection = mysql.createConnection({
  host     : dbhost,
  user     : "adminuser",
  password : "adminpassword",
  port     : "3306"
});

connection.connect(function(err) {
  if (err) {
    console.error('Database connection failed: ' + err.stack);
    status = "Connection to database failed hello world";
    return;
  }
  status = "Connection to database successfull hello world";
  console.log('Connected to database.');
});

connection.end();

var app = express();


app.listen(3000, () => console.log('API listening on port 3000!'))

app.get('/', function (req, res) {
    res.send({
        "status": status
    })
});

module.exports = app;
