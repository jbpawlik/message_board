class Message
  attr_reader :id, :timestamp 
  attr_accessor :name

  @@messages = {}
  @@total_rows = 0

  def initialize (attributes)
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id) || @@total_rows +=1
    @timestamp = attributes.fetch(:timestamp)
  end

  def self.all
    @@messages.values
  end

  def ==(message_to_compare)
    self.name == message_to_compare.name
  end

  def save
    @@messages[self.id] = Message.new({:name => self.name, :id => self.id, :timestamp => self.timestamp})
  end

  def self.clear
    @@messages = {}
  end

  def self.find(id)
    @@messages[id]
  end

  def update(name)
    @name = name
  end
end