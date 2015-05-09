#Hair Salon

The hair salon app is not currently functioning. I cannot see any reason why it is not working, and have tried all the debugging I know. The delete function seemed to introduce probelms into the program, the last fully functioning commit is at: *commit ae256f91f0e344cabeef37072fce884bf3b22e8f*

To set up database:

CREATE DATABASE hair_salon;
\c hair_salon;
CREATE TABLE clients (id serial PRIMARY KEY, name varchar, stylist_id int);
CREATE TABLE stylists (id serial PRIMARY KEY, name varchar);
CREATE DATABASE hair_salon_test WITH TEMPLATE hair_salon;


Requirements:

- Ruby 2.2.0
- Rubygems, Bundler
- Sinatra
- Capybara - for testing

##Author
Adam McFadden

##License
GPL v2

Copyright &copy; Adam McFadden 2015.
