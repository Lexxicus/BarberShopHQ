require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require 'sqlite3'

set :database, {adapter: "sqlite3", database: "barbershop.db"}

#set :database, "sqlite3:barbershop.db"

class Clients < ActiveRecord::Base
  validates :name, presence: true
  validates :phone, presence: true
  validates :barber, presence: true
  validates :datestamp, presence: true
  validates :color, presence: true
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
  c = Clients.new params[:client]
  c.save
  @article = c.errors.full_messages
  @congrat = "<h4> Спасибо что пользуетесь нашими услугами! </h4>"
  erb :visit
end