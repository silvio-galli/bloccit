# Bloccit
A Reddit replica that lets users create discussion topics, post on them, comment posts, and vote them.

Made with the help of my mentor [Charlie Gaines](https://github.com/beaugaines) at [Bloc](http://www.bloc.io).

[Demo available here](https://safe-shelf-3324.herokuapp.com/) on Heroku platform.

The source code is on [GitHub](https://github.com) at: [https://github.com/silvio-galli/bloccit](https://github.com/silvio-galli/bloccit)

### Tech specs
The project is based on **Ruby on Rails**, uses **Bootstrap** for the layout and other elements on the page.

Makes also use of **jQuery** for asyncronous comments creation and deletion.

Authentication makes use of `Bcrypt` gem to store a secure hash of users' passwords.

Sign-up is implemented by [`User` model validations](app/modles/user.rb) and based on the `uniqueness` of email address.

Sign-in is managed through [`SessionsController`](app/controllers/sessions_controller.rb) class.

Everyone is allowed to read topics, posts and comments, but users that want to use the app (create posts or comment posts) are required to sign in through the [`ApplicationController` class private method `require_sign_in`](app/controllers/application_controller.rb).

Authorization is handled through a `before_action` callback of [`TopicsController`](app/controllers/topics_controller.rb), [`PostsController`](app/controllers/posts_controller.rb) and [`CommentsController`](app/controllers/comments_controller.rb) private method `authorize_user`.
