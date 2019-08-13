var express = require('express');

var mysql = require('mysql');

let status = "";

var connection = mysql.createConnection({
  host     : "sm1hxmkwzunic1l.cux5hwsmbyzf.us-east-1.rds.amazonaws.com",
  user     : "adminuser",
  password : "adminpassword",
  port     : "3306"
});

connection.connect(function(err) {
  if (err) {
    console.error('Database connection failed: ' + err.stack);
    status = "Connection to database failed";
    return;
  }
  status = "Connection to database successfull";
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
