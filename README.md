Rails Decal Homework 1
---------------------

For homework 1 we are going to make a dynamic website that contains a static page about yourself and dynamic pages that work with the User model.  The main page will be and index of all the users in your database.  Clicking on one of the users will give you a detailed view of the user.
From the Add User button on the top left of the user index you can go to a page that will allow you to add users to your database.  For a link to a basic version of the completed website go here:

http://powerful-forest-5694.herokuapp.com/

What To Do:

Removing yearsOld and adding Age
Currently in our user table to keep the age of our user we have a column years old.  Let's say we determine that we are lazy and yearsOld is a terrible name for a column and we want to name the column age instead.  We have not put our rails app online and
since we only have test data it is cool to delete the yearsOld column and add the age column.  TO REMOVE A COLUMN WE DO NOT WANT TO EDIT OUR MIGRATION FILES.  We should rather run another migration that will tell our database to delete the column.  Since
rails is nice and has all these magical powers we can easily generate a migration by typing the command:

rails generate migration RemoveCOLUMNFromTABLE COLUMNNAME:DATATYPE

Where we enter the correct values for the words that are all caps.  This means for our purpose we want to do this command:

rails generate migration RemoveYearsOldFromUsers yearsOld:integer

Now that the column is gone we want to add our new age column.  To create a migration to add a column to a table we use the command:

rails generate migration AddCOLUMNToTABLE COLUMNNAME:DATATYPE

where we replace all the uppercase words to the correct value.  This means we should type the command:

rails generate migration AddAgeToUsers age:integer

Now that our Users now have these fields we have to update our show view, the new view, and the user_params to use the age column rather than the years old column.  After we do that we should test our app to see if any future users we add saves the age and
correctly displays it.

Adding a major column to the user.
First we want to add a column to the user by doing a migration.  Create a migration that will add the column major to the user table.  After that we want to display it in the show view of the user using embedded ruby.  Now try opening up the rails console
and udpate the users column field manually.  Use the show view to verify that the major is showing.  Finally we want to add the field major to the form field in the new users page and make sure to add the major field as a permitted field in the user_params
in the UsersController.
