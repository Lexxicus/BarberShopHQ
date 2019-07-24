require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require 'sqlite3'

set :database, {adapter: "sqlite3", database: "barbershop.db"}

#set :database, "sqlite3:barbershop.db"

class Clients < ActiveRecord::Base

end

class Barber < ActiveRecord::Base

end

class Contacts < ActiveRecord::Base

end

before do
  @barbers = Barber.all
end

get '/' do
	erb :index
end

get '/visit' do
  erb :visit
end

post '/visit' do

  @name = params[:name]
  @phone = params[:phone]
  @datestamp = params[:datestamp]
  @barber = params[:barber]

  c = Clients.new
  c.name = @name
  c.phone = @phone
  c.datestamp = @datestamp
  c.barber = @barber
  c.save

  @congrat = " Спасибо что пользуетесь нашими услугами!"

  erb :visit
end