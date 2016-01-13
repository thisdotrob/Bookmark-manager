# Makers Academy Week 4 - Bookmark Manager

This week's pairing challenge was to build a bookmark manager, similar to pineapple.io or delicious.com in spirit.
The goal was to expose us to the following aspects of web development:
- Relational databases
- Security considerations
- More feature testing with Capybara

We were given this basic user interface sketch:

![UI sketch](http://i.imgur.com/CYMrSYE.png)

## User Stories

```
As a time-pressed user
So that I can quickly go to web sites I regularly visit
I would like to see a list of links on the homepage

As a time-pressed user
So that I can quickly find web sites I recently bookmarked
I would like to see links in descending chronological order

As a time-pressed user
So that I can save a website
I would like to add the site's address and title to my bookmark manager

As a time-pressed user
So that I can organise my many links into different categories for ease of search
I would like to add tags to the links in my bookmark manager

As a time-pressed user
So that I can quickly find links on a particular topic
I would like to filter links by tag
```

## Setup
0. Install postgresql: http://www.postgresql.org/download/
0. create a new database in postgresql called `"bookmark_manager_development"`
0. run `rake db:auto_migrate`
0. clone this repo
0. run `bundle install`
0. run `rake db:auto_upgrade`
0. run `rackup`
0. visit http://localhost:9292

## Tests
0. create a new database in postgresql called `"bookmark_manager_test"`
0. run `rake db:auto_migrate RACK_ENV="test"`
0. run `rspec`
