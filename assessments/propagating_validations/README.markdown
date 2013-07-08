## Overview
In order to protect the integrity of your data, you will often need to prevent
users from creating records with information that doesn't meet your constraints.
A good practice is to inform the user why you did not save the data, and allow
them to correct their errors.

Start with this
[skeleton](http://s3.amazonaws.com/dbc_socrates/challenges/ar-propagate-validations.zip)
and follow the instructions below.

### Core
Use ActiveRecord and Sinatra to allow anyone to create an event, so long as it
passes validation rules.

#### Objectives
Add validations to the Event model and show appropriate messages to the user
when the validations fail.

1. Prevent Events from being saved when:
  a. The events date is empty, in the past, or is not valid.
  b. The events title is already taken or empty.
  c. The event organizers name is empty.
  d. The event organizers email address is invalid.


### You Will Know You Are Done When:

1. Invalid Events are not created when the form is posted.
2. The user is informed for each failing validation.
2. The form remains populated with the users input after posting.
3. Bonus points if errors are presented near the invalid form field.


### Stretch OPTIONAL
An even better practice is to guide the users input to follow the format your
program expects and/or make your program more flexible regarding the data it
accepts from the user.

Computers should serve people. Not the other way around.

#### Objectives

1. Modify the UI so a user is coerced into entering a valid date. Hint: Consider
   using a Datepicker.
2. Modify the controller or model to be more flexible with the format of dates it
   accepts while still saving reasonable dates to the database. Hint: look into
   the rubygem Chronic.
