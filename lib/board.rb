class Board
  attr_reader :id, :timestamp 
  attr_accessor :name

  @@boards = {}
  @@total_rows = 0

  def initialize (attributes)
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id) || @@total_rows +=1
    @timestamp = attributes.fetch(:timestamp)
  end

  def self.all
    @@boards.values
  end

  def ==(board_to_compare)
    self.name == board_to_compare.name
  end

  def save
    @@boards[self.id] = Board.new({:name => self.name, :id => self.id, :timestamp => self.timestamp})
  end

  def self.clear
    @@boards = {}
    @@total_rows = 0
  end

end
