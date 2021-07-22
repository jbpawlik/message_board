require 'simplecov'
SimpleCov.start
require 'rspec'
require 'board'

describe '#board' do

  before(:each) do
    Board.clear()
  end

  describe('.all') do
    it("it returns an array of empty boards") do
      expect(Board.all).to(eq([]))
    end
  end

  describe('#save') do
    it("saves a board") do
      board = Board.new({:name => "forum", :id => nil, :timestamp => Time.new})
      board.save()
      expect(Board.all).to(eq([board]))
    end
  end

  describe('#==') do
    it('if a board has the same attributes as another, they are the same') do
      board = Board.new({:name => "forum", :id => nil, :timestamp => Time.new})
      board.save
      board2 = Board.new({:name => "forum", :id => nil, :timestamp => Time.new})
      board2.save
      expect([board]).to(eq([board2]))
    end
  end

  describe('.clear') do
    it('clears all stages') do
      board = Board.new({:name => "forum", :id => nil, :timestamp => Time.new})
      board.save
      board2 = Board.new({:name => "forum", :id => nil, :timestamp => Time.new})
      board2.save
      Board.clear
      expect(Board.all).to(eq([]))
    end
  end

  describe('.find') do
    it("will find a board by its id") do
      board = Board.new({:name => "forum", :id => nil, :timestamp => Time.new})
      board.save
      board2 = Board.new({:name => "forum", :id => nil, :timestamp => Time.new})
      board2.save
      expect(Board.find(board2.id)).to(eq(board2))
    end
  end

  describe('#update') do
    it('will update an board') do
      board = Board.new({:name => "forum", :id => nil, :timestamp => Time.new})
      board.save
      board.update({:name => "shrimp talk"})
      expect(board.name).to(eq({:name=>"shrimp talk"}))
    end
  end
end
