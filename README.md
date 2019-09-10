As a user of the system
So I can see all my websites
I would like to be able to see a list of all my bookmarks

Domain Model


Client
Controller
Model
View
/bookmarks -> get
app.rb
-> get all
<- all bookmarks
-> push to era

Bookmark Class
Erb Bookmark

** DATABASE CREATION INSTRUCTIONS; **

step1; create database- CREATE DATABASE bookmark_manager;
step2; connecting to the database- \c bookmark_manager;
step3; creating a 'bookmarks' table- CREATE TABLE bookmarks(id SERIAL PRIMARY KEY, url VARCHAR(60));
step4; documenting the database setup- CREATE TABLE bookmarks(id SERIAL PRIMARY KEY, url VARCHAR(60));

** TEST DATABASE CREATION INSTRUCTIONS; **

step1; create database- CREATE DATABASE bookmark_manager_test;
step2; connecting to the database- \c bookmark_manager_test;
step3; creating a 'bookmarks' table- CREATE TABLE bookmarks(id SERIAL PRIMARY KEY, url VARCHAR(60));
