class Dog
  # code goes here
  @@all = []
  attr_accessor :mood, :owner
  attr_writer 
  attr_reader :name
  def initialize(name, owner, mood = "nervous")
    @name = name
    @mood = mood
    @owner = owner
    @@all << self
  end
  def self.all
    @@all
  end
end