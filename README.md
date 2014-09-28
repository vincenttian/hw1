Rails Decal Homework 1
---------------------

For homework 1 we are going to make a dynamic website that contains a static page about yourself and dynamic pages that work with the User model.  The main page will be and index of all the users in your database.  Clicking on one of the users will give you a detailed view of the user.
From the Add User button on the top left of the user index you can go to a page that will allow you to add users to your database.  For a link to a basic version of the completed website go here:

http://powerful-forest-5694.herokuapp.com/

What To Do:

Displaying values on the Show User Page:
  If we look at routes file we see a get request for 'users/:id' that will link to the UsersController's show function (app/controllers/users_controller).  The :id just means the value that comes after the / will be put into a dictionary (hashMap if you have
  taken 61B) called params with the key being :id and the value being whatever comes after the /.  We won't worry about how we are passing the id's when we click on users in our index page for now.  Now let's take a look at the UsersController.  In the show
  function we call User.find(params[:id]).  What User.find(num) does is it queries the User table for a user with id num.  You can open up the rails console and try this yourself.  If we look at the show view
  (app/views/users/show.html.erb) we are trying to access a variable called @user.  We should go in the controller and tie the variable @user to the output of User.find so our view has access to the user's content.  Our show should now look like:

  def show
    @user = User.find(params[:id])
  end

  After doing that click on a user in the index to see the show view.

Adding the new function to the controller
  On the top left of the index page the AddUser button links to a '/user/new', however there is no route for that (our rails application does not know how to process that GET request) and there is no new command in our controller, but there is a new view.  If
  we look at our new view we can see that it needs a variable called @user which is a object of model User.  That means in our UsersController (app/controllers/users_controller.rb) we should define a function called new and create an empty user called @user
  for our view to use:

  def new
    @user = User.new
  end

  After we do that and save we should route our new user page as:

    get '/user/new', to: 'CONTROLLER#FUNCTION'

  Try to figure out what to replace CONTROLLER and FUNCTION with (Look at how routed the show and the about page).  After we finish the routing we should click the Add User button on the top left to check to see if we get to the new page.  If that works
  try adding users by inputting names, clicking create, and clicking on home to check.

Adding yearsOld to form input
  So right now the only field you can add to your user when you create one is the users name.  Our users have a column called yearsOld that we want to also keep.  To do this we want to add a form input to the new users view.  To do this simply copy the
  form input for the name and paste it next to it.  Instead of ':name' though we want the form input to match up to ':yearsOld'.  This value tells the form input what it should match up to.  After we copy the form input try and add a new user with a yearsOld
  value.  Go to the show view of the user and check if it has an age.  If you look the age doesn't appear there, but why?.  In rails, we have a concept of strong parameters, which means that our app will only allow specific parameters to be passed to our
  controller.  This provides security incase someone wants to add or edit information they don't have access to.  If you open up the UsersController (app/controllers/users_controller.rb) and look at the create function you will notice that it runs the create
  function (think about the create function as calling new function then the save function of the model) on the paramenter user_params.  If we go to the bottom of the file user_params only permits the :name hash to be passed on. If we add a the yearsOld hash so
  it reads:

  params.require(:user).permit(:name, :yearsOld)

  We tell rails we are going to allow yearsOld to be passed along.  Save and try now to add a user through the new view and the yearsOld value should now save.

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
