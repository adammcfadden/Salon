require 'rspec'
require 'client'
require 'stylist'
require 'pg'

DB = PG.connect({:dbname => 'hair_salon_test'})

RSpec.configure do |config|
  config.before(:each) do
    DB.exec("DELETE FROM stylists *;")
    DB.exec("DELETE FROM clients *;")
  end
end
