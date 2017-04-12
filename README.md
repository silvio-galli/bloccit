# Bloccit [![Code Climate](https://codeclimate.com/github/silvio-galli/bloccit/badges/gpa.svg)](https://codeclimate.com/github/silvio-galli/bloccit)

A Reddit replica that lets users create discussion topics, post on them, comment posts, and vote them.

Made with the help of my mentor [Charlie Gaines](https://github.com/beaugaines) at [Bloc](http://www.bloc.io).

[Demo available here](https://safe-shelf-3324.herokuapp.com/) on Heroku platform.

The source code is on [GitHub](https://github.com) at: [https://github.com/silvio-galli/bloccit](https://github.com/silvio-galli/bloccit)

## Tech specs
The project is based on **Ruby on Rails**, uses **Bootstrap** for the layout and other elements on the page.

Makes also use of **jQuery** for asyncronous comments creation and deletion.

**Authentication** makes use of `bcrypt` gem to store a secure hash of users' passwords.
Sign-up is implemented by [`User` model validations](app/models/user.rb) and based on the `uniqueness` of email address.
Sign-in is managed through [`SessionsController`](app/controllers/sessions_controller.rb) class.

**Authorization** is not supported by a gem, but is handled through a `before_action` callback to `authorize_user` private method in [`TopicsController`](app/controllers/topics_controller.rb) (only `admin` user can create new topics), [`PostsController`](app/controllers/posts_controller.rb) (only the owner or `admin` user can update, edit or delete a post) and [`CommentsController`](app/controllers/comments_controller.rb) (only the owner or `admin` user can update, edit or delete a comment).

Everyone is allowed to read topics, posts and comments, but users who want to create posts or comment them (only admin user are allowed to create topics) are required to sign in through the [`require_sign_in` private method](app/controllers/application_controller.rb) (in `ApplicationController` class) called inside [`TopicsController`](app/controllers/topics_controller.rb), [`PostsController`](app/controllers/posts_controller.rb) and [`CommentsController`](app/controllers/comments_controller.rb).

## Features
- Everybody is allowed to read topics, posts and comments.
- Member users can create posts and comments. Admin users can create public or private topics, posts and comments.
- Every new user is registered as *member user*. Right now, it's not possible for a member user to upgrade to admin.
- Every user can favorite specific posts and will receive notifications via email every time another user will comment his/her favorited posts.
- At this very moment, there is no possibility for a user to cancel from the application.

---
###### mentioned gems
![](https://img.shields.io/badge/rails-4.2.4-green.svg?style=flat)
![](https://img.shields.io/badge/bootstrap_sass-3.3.5.1-green.svg?style=flat)
![](https://img.shields.io/badge/jquery_rails-4.0.5-green.svg?style=flat)
![](https://img.shields.io/badge/bcrypt-3.1.10-green.svg?style=flat)
