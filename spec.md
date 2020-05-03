# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
   Sinatra used as the framework to build the application.
- [x] Use ActiveRecord for storing information in a database
   Activerecord used to store user data and all information.
- [x] Include more than one model class (e.g. User, Post, Category)
   Two model classes created: Guard & Report models.
- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts)
   One has_many relationship included. A Guard has many Reports.
- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User)
   One belongs_to relationship included. A Report belongs to a Guard.
- [x] Include user accounts with unique login attribute (username or email)
   User accounts accessed through unique login credentials using email.
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
   A Report can be created, viewed or read, updated and deleted.
- [x] Ensure that users can't modify content created by other users
   A Guard can only modify a report they have access to by ownership of that report.
- [x] Include user input validations
   Using ActiveModel Validations gem, user input is validated.
- [x] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
   Validation errors are displayed on views using ActiveModel and HTML form validations.
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [ ] You have a large number of small Git commits
- [ ] Your commit messages are meaningful
- [ ] You made the changes in a commit that relate to the commit message
- [ ] You don't include changes in a commit that aren't related to the commit message
