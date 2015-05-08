require 'rspec'
require 'client'
require 'stylist'
require 'pg'
require 'capybara/rspec'
require './app'


DB = PG.connect({:dbname => 'hair_salon_test'})

RSpec.configure do |config|
  config.before(:each) do
    DB.exec("DELETE FROM stylists *;")
    DB.exec("DELETE FROM clients *;")
  end
end

set(:show_exceptions, false)
