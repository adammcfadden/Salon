require 'sinatra'
require 'sinatra/reloader'
require './lib/client'
require './lib/stylist'
require 'pg'
require 'pry'
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

get('/client/:id') do
  @id = params.fetch('id').to_i()
  @client = Client.find(@id)
  @name = @client.name()
  @stylist = @client.stylist().name()
  @stylists = Stylist.all()
  @selector = nil
  erb(:client)
end

get('/:id/:selector') do
  @selector = params.fetch('selector')
  @id = params.fetch('id').to_i()
  @client = Client.find(@id)
  @name = @client.name()
  @stylist = @client.stylist().name()
  @stylists = Stylist.all()
  erb(:client)
end

patch('/edit/client/:id') do
  @selector = nil
  @id = params.fetch('id').to_i()
  @client = Client.find(@id)
  @client.update({:name=> params.fetch('client_edit')})
  @name = @client.name()
  @stylist = @client.stylist().name()
  @stylists = Stylist.all()
  erb(:client)
end

patch('/add/stylist/:id') do
  @selector = nil
  @id = params.fetch('id').to_i()
  @client = Client.find(@id)
  @name = @client.name()
  @stylist_id = params.fetch('stylist_selector').to_i()
  stylist = Stylist.find(@stylist_id)
  stylist.update({:client_ids => [@id]})
  @stylist = @client.stylist().name()
  @stylists = Stylist.all()
  erb(:client)
end
