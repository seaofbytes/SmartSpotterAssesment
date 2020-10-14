# Deployed on heroku

https://sheltered-ocean-08330.herokuapp.com/

# Context

Evil Corp is a growing company, and has a lovely office in Amsterdam.
As teams are expanding, we sometimes want to use the same meeting rooms for different teams.
In this phase of our transformation into a big evil corporate, we now need a meeting rooms booking application.

# Goal

You'll cover some basics about API design and TDD.
As such, you'll mainly focus on the backend of the application.
Others will build apps later, using your API as backbone.

The following user stories describe what should be possible to do through this API:

- A visitor can sign up (only with an "@evil-corp.com" e-mail address though)
- A user can book a room, without conflicting times and dates. So you can't book an occupied room.
- A user can update their own booking
- A user can cancel their own booking
- A user can view all of the bookings
- A user can invite other users to the booking

# Skeleton

We bootstrapped a skeleton for you. We covered the authentication part for you and setup some models, controllers, tests and routes. It's up to you to find out where you should continue. Try to test at least one request and one function. Nowadays we don't really test controller actions anymore but mostly the request.

## Tooling

- You must use **RSpec** for TDD (focus on acceptance and integration tests)
- You can use **Postman** to test out your API (we **strongly** advice you to use this tool)
- You can use any convenient gems you may need
- Your code must be available on **GitHub / Gitlab**
- The API must be deployed on **Heroku** (Bonus points)

## Timeline

Our employees are expecting to be able to use this app in 1 week. Move fast!

## Questions

Please contact us if you have any questions. There is no right or wrong question and we rather help you than have you get stuck for hours. Feel free to contact Martijn: martijn@smartspotter.com

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Installing Ruby (with [rbenv](https://github.com/sstephenson/rbenv))

Run this command, this might take **a few minutes**

```
rbenv install 2.5.5
```

Once the ruby installation is done, run this command to tell the system
to use the 2.5.5 version by default.

```
rbenv global 2.5.5
```

### Installing Postgresql

Let's install Postgresql, an open-source robust and production-ready database.

```
brew install postgresql
brew services start postgresql
```

### Installing Rails

Run the following command to install Rails version 5.2.3

```
gem install rails -v 5.2.3
```

### Setup Project

Clone git repository using the following command:

```
git clone https://github.com/SmartSpotter/SmartSpotter-Assessment.git
cd SmartSpotter-Assessment
```

Install all dependencies.

```
bundle install
```

Create db and migrate schema.

```
rails db:create
rails db:migrate
rails db:seed
```

Now run the application.

```
rails s
```

Run tests

```
rspec . -fd
```
