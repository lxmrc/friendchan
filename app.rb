require 'sinatra'
require 'sinatra/activerecord'
require 'sqlite3'
require_relative 'app/models/topic'
require_relative 'app/models/post'
require 'fileutils'

# Configure database based on environment
db_path = ENV['RACK_ENV'] == 'production' ? '/tmp/app.db' : 'db/app.db'
set :database, {adapter: 'sqlite3', database: db_path}

# Ensure database directory exists
FileUtils.mkdir_p(File.dirname(db_path)) unless File.directory?(File.dirname(db_path))

get '/' do
  @topics = Topic.order(created_at: :desc)
  erb :index
end

get '/topics/new' do
  erb :topics_new
end

post '/topics' do
  @topic = Topic.new(params[:topic])
  if @topic.save
    redirect '/'
  else
    erb :topics_new
  end
end

get '/topics/:id' do
  @topic = Topic.find(params[:id])
  erb :topics_show
end

post '/topics/:topic_id/posts' do
  @topic = Topic.find(params[:topic_id])
  @post = @topic.posts.build(params[:post])
  if @post.save
    redirect "/topics/#{@topic.id}"
  else
    erb :topics_show
  end
end
