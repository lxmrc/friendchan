require 'sinatra'
require 'sinatra/activerecord'
require 'sqlite3'

set :database, {adapter: 'sqlite3', database: 'db/app.db'}

get '/' do
  'Hello world!'
end
