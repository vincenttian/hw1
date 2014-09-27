Rails Decal Homework 1
---------------------

For homework 1 we are going to make a dynamic website that contains a static page about yourself and dynamic pages that work with the User model.  The main page will be and index of all the users in your database.  Clicking on one of the users will give you a detailed view of the user.
From the Add User button on the top left of the user index you can go to a page that will allow you to add users to your database.  For a link to a basic version of the completed website go here:

http://powerful-forest-5694.herokuapp.com/

What To Do:

Adding a major column to the user.
First we want to add a column to the user by doing a migration.  Create a migration that will add the column major to the user table.  After that we want to display it in the show view of the user using embedded ruby.  Now try opening up the rails console
and udpate the users column field manually.  Use the show view to verify that the major is showing.  Finally we want to add the field major to the form field in the new users page and make sure to add the major field as a permitted field in the user_params
in the UsersController.
