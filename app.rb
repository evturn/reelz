require 'bundler'
Bundler.require
ActiveRecord::Base.establish_connection({
  adapter: 'postgresql',
  database: 'movielens_db'
  })

require_relative 'models/movie'
require_relative 'models/tag'
require_relative 'models/comment'

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








# index: Display all of a movie's comments
get '/movies/:movie_id/comments' do
  @movie = Movie.find(params[:movie_id])
  @comments = Comment.all
  erb :"comments/index"
end

# new: Return a form for a comment
get '/movies/:movie_id/comments/new' do
  @movie = Movie.find(params[:movie_id])
  erb :"comments/new"
end

# create: Create a new comment
post '/movies/:movie_id/comments' do
  bod = params['comment_body']
  movie = Movie.find(params[:movie_id])
  comment = Comment.create({bod: bod})
  movie.comments << comment
  redirect "/movies/#{ movie.id }/comments/#{ comment.id }"
end

# edit: Return a form to edit a comment
get '/movies/:movie_id/comments/:id/edit' do
  @movie = Movie.find(params[:movie_id])
  @comment = Comment.find(params[:id])
  erb :"comments/edit"
end
# update: Update a comment
patch '/movies/:movie_id/comments/:id' do
  movie = Movie.find(params[:movie_id])
  comment = Comment.find(params[:id])
  comment.update({bod: params['comment_bod']})
  redirect "/movies/#{ movie.id }/comments/#{ comment.id }"
end

# show: Display a single comment
get '/movies/:movie_id/comments/:id' do
  @movie = Movie.find(params[:movie_id])
  @comment = Comment.find(params[:id])
  erb :"comments/show"
end

# destroy: Delete a comment
delete '/movies/:movie_id/comments/:id' do
  Comment.delete(params[:id])
  redirect "/movies/#{ params[:movie_id] }/comments"
end





