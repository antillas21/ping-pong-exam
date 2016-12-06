## Getting Started

1. Run `bundle`
2. Run `rake db:migrate`
3. Run `rake db:seed`
4. Run `rails s`
5. Create a new account

## Description

The purpose of this app is to allow users to track their ping pong games and to show the current leaderboard of players in the office.

Once logged in, users can log games against other opponents, see the history of their games and see the current leaderboard.

A leaderboard keeps track of the rankings of a group of players or teams over time.  This is an [example of a leaderboard in the context of socccer](http://www.fifa.com/fifa-world-ranking/ranking-table/men/), this is an [example of a leaderboard](https://ratings.fide.com/top.phtml?list=men), in the context of chess.

## Requirements

Please devote 3-4 hours to the following tasks. Add all necessary migrations, models (with relationships, methods and validations), controllers, and tests.

1. Add necessary functionality to log a game between two users
  * Games follow standard ping pong rules. They are games to 21, which need to be won by a two point margin.
  * Games are inputted on the honor system (no handshaking of approval of a score)
2. Add history page which allow the logged in user to view history of games they participated in. This includes: timestamp, opponent user, game score
3. Populate the leaderboard page with current rankings:
  * Rankings are updated every time a game is logged
  * Not all wins should count the same. e.g: a player ranked 4 beating a player ranked 5 should not count the same as a player ranked 5 beating a player ranked 1
  * When the leaderboard is first created all the users will be equal in ranking
4. Populate all necessary models and controllers to support this functionality
5. Populate all necessary tests for the models and the controllers
6. Upload your code to a public repository
7. Deploy the solution to Heroku to complete the task

Please note the following:

* The UI uses bootstrap 3.3.5. [See docs here](http://getbootstrap.com/css/).
* The current Gemfile should be sufficient for the task. Please feel free to include `rspec` (if needed) and deployment-related gems.

# Evaluation Scoring

We are evaluating you as a backend ruby developer.  We will score your completion of the task as follows:

* 30 points for code completion (leaderboard algorithm, UI, methods, controllers)
* 30 points for code quality (RESTful, simple)
* 10 points for tests coverage
* 10 points for lack of bugs
* 10 points for deployment
* 10 points for sound logic around coding decisions
