require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require 'sqlite3'

set :database, {adapter: "sqlite3", database: "barbershop.db"}

#set :database, "sqlite3:barbershop.db"

class Clients < ActiveRecord::Base
  validates :name, presence: true, length: {minimum:  3}
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
  @c = Clients.new
  erb :visit
end

post '/visit' do
  @c = Clients.new params[:client]
  if @c.save
    @congrat = "<h4> Спасибо что пользуетесь нашими услугами! </h4>"
  else
    @error = @c.errors.full_messages.first
  end
  erb :visit
end

get '/barber/:id' do
  @barber = Barber.find params[:id]
  erb :barber
end

get '/booking' do
  @clients = Clients.order 'created_at DESC'
  erb :booking
end

get '/client/:id' do
  @client = Clients.find params[:id]
  erb :client
end