var faker = require('faker');
var mysql = require('mysql');

var connection = mysql.createConnection({
  host     : 'localhost',
  user     : 'pokham',  //your root username (leave as root)
  database : 'join_us'});  //the name of your db (create this if you haven't already)


// Selecting Data

// var q = 'SELECT * FROM users';
// connection.query(q, function (error, results, fields) {
//   if (error) throw error;
//   console.log(results[1].email)
// });

//Inserting Data

// var q = 'INSERT INTO users (email) VALUES("rusty_the_dog@gmail.com")';

// connection.query(q, function (error, results, fields) {
//   if (error) throw error;
//   console.log(results)
// });

// Inserting Data Take 2

// var person =  {email: 'Jenny467@gmail.com'};

// connection.query('INSERT INTO users SET ?', person, function (error, results) {
//   if (error) throw error;
//   console.log(results)
// });

// // Inserting Data Take 3
// var person =  {
//     email: faker.internet.email(),
//     created_at: faker.date.past()
// };

// connection.query('INSERT INTO users SET ?', person, function (error, results) {
//   if (error) throw error;
//   console.log(results)
// });
// connection.end();
// // console.log(faker.internet.email());

// Inserting Lots of Data---
var data = [];
for(var i = 0; i< 500; i++){
data.push([
    faker.internet.email(),
    faker.date.past()
    ]);
}
//console.log(data);

var q = 'INSERT INTO users(email, created_at) VALUES ?';

connection.query(q, [data], function(error,result){
    console.log(error);
    console.log(result);
});

connection.end();

