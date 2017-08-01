# README

#### Ruby version, Rails Version

 Ruby 2.4.1
 Rails 5.1.2

#### System dependencies
It contains .ruby-version, .ruby-gemset files so it can be used with any ruby manager for example RVM

#### Configuration
Make sure you have Bundler install and run:
`bundle install`

#### Database creation
Database is SQlite local storage, to prepare:

    bundle exec rake db:create
    bundle exec rake db:migrate

#### Database initialization
To upload data from votes.txt file run

    bundle exec rake db:seed
If line is invalid and does not meet cryteria console output will print out the notifiticaion, example:

    "Line cannot be imported, does not much criteria:"
    "DEFAULT 1168123059 Campaign:ssss_uk_zzactions CONN:MIG01TU MSISDN:00777778559999 GUID:50E9B098-4F3E-4433-AC0B-AC55A7290117 Shortcode:63334"

#### How to run the test suite

    bundle exex rspec -f d

#### Implementations Notes
When Implementing Application these major factors were taken into consideration
* Read/Only view applications (displays only data)
* Time Constraint
* No roadmap for future development
#### Objects Universe
The application was delivered with one simple object Vote, this made uploading data very simple and reduce the code. To speed up querying we added indexes on table columns we filter or query.

Things to consider:
* Creating Campaign object, this would speed up querying data in future. Allow to create empty/test campaign and isolate data for each one.
* Creating Choice/Person/Candidate this might make data more complex in searching but depends on criteria will enable the ability to validate Choice and deal with problems like case-sensitivity in Votes and made sure votes are correct or display data from the Choice side.
#### Design and testing
Moving all complexity to Query Controller Object enabled:
* DRY controllers no querying inside of actions
* Control the params coming into object
* We can use memoization and avoid querying object to many times.
* As query object part of the controller, it allows controller spec to behave as simple e2e test.

Things to consider:
* Create a decorator object to DRY up views and avoid calling chaining methods in the view ex. `@dashboard.votes.count` or `@dashboard.by_choice(choice).count`
* Create more view helpers to for example to display the progress bar.
* Add validations in controllers for params, for example, same as we validate


    def sortable_columns
      ["campaign", "choice", "validity"]
    end

We can validate campaign (making sure w don't display empty ones)
##### Third party tools used:
* https://github.com/mislav/will_paginate gem to paginate votes
* https://v4-alpha.getbootstrap.com/examples/dashboard/ Bootstrap CSS framework with Dashboard example.
* https://richonrails.com/articles/sortable-table-columns a quick example how to sort columns. I used before and works nicely with turbo-link.
* https://github.com/thoughtbot/factory_girl_rails for object test factories
* https://github.com/thoughtbot/shoulda-matchers.git for validation object testing
* RSpec as testing framework.


