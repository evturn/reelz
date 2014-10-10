require 'bundler'
Bundler.require

ActiveRecord::Base.establish_connection({
  adapter: 'postgresql',
  database: 'movielens_db'
  })

require_relative 'models/movie'
require_relative 'models/tag'

get '/' do
  erb :index
end

# index: Display all the movies
get '/movies' do
  @movies = Movie.all
  erb :"movies/index"
end

# show: Display a single movie
get '/movies/:id' do
  @movie = Movie.find(params[:id])
  @tags = @movie.tags
  erb :"movies/show"
end



