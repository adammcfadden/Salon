require 'sinatra'
require 'sinatra/reloader'
require './lib/client'
require './lib/stylist'
require 'pg'
also_reload './lib/*/**.rb'


DB = PG.connect({:dbname => 'hair_salon'})


get('/') do
  @clients = Client.all()
  @stylists = Stylist.all()
  @selector = nil
  erb(:index)
end

get('/index/new/:selector') do
  @selector = params.fetch('selector')
  @clients = Client.all()
  @stylists = Stylist.all()
  erb(:index)
end

post('/new/stylist') do
  stylist = Stylist.new({:name => params.fetch('stylist_entry'), :id => nil})
  stylist.save()
  @clients = Client.all()
  @stylists = Stylist.all()
  @selector = nil
  erb(:index)
end

post('/new/client') do
  client = Client.new({:name => params.fetch('client_entry'), :id => nil})
  client.save()
  @clients = Client.all()
  @stylists = Stylist.all()
  @selector = nil
  erb(:index)
end
