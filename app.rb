require('sinatra')
require('sinatra/reloader')
require('./lib/message')
require('./lib/board')
require('pry')
also_reload('lib/**/*.rb')

get('/') do
  redirect to('/boards')
end

get('/boards') do
  @boards = Board.all()
  erb(:boards)
end

get('/boards/new') do
  erb(:new_board)
end

post('/boards') do
  name = params[:name]
  board = Board.new({:name => name, :id => nil, :timestamp => Time.new})
  board.save
  redirect to('/boards')
end

get('/boards/new') do
  erb(:new_board)
end

get('/boards/:id') do
  @board = Board.find(params[:id].to_i())
  erb(:board)
end

get('/boards/:id/edit') do
  @board = Board.find(params[:id].to_i())
  erb(:edit_board)
end

patch('/boards/:id') do
  @board = Board.find(params[:id].to_i())
  @board.update(params[:name])
  @boards = Board.all
  erb(:boards)
end


# attributes.fetch(:name)