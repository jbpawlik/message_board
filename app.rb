require('sinatra')
require('sinatra/reloader')
require('./lib/message')
require('./lib/board')
require('pry')
also_reload('lib/**/*.rb')

get('/boards') do
  erb(:boards)
end