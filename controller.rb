require 'sinatra'
require './database.rb'


get '/' do
	redirect to '/movies'
end

get '/movies' do
	db = DBHandler.new 
	@movies = db.all 
	erb :application do #the general feel
		erb :index #shows the records from the database
	end
end

get '/movies/new' do
	erb :application do
		erb :new
	end
end

post '/movies' do
	db = DBHandler.new
	db.create(params[:movie])
	redirect to '/movies'
	#store in db
end


get '/movies/:id' do 
	db = DBhandler.new
	@movie = db.get(params[:id].to_i)
	erb :application do
		erb :show
	end
end

post 'movies/:id/edit' do
	db = DBHandler.new
	db.update(params[:id].to_i, [:name])
	redirect to '/movies'
end

get '/movies/:id/edit' do
	db = DBHandler.new
	@movie = db.get(params[:id].to_i)
	erb :application do
		erb :edit
	end
end

get '/movies/:id/delete' do
	db =DBHandler.new
	db.destroy(params[:id].to_i)
end
