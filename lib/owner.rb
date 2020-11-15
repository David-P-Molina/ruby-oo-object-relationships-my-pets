require "pry"
class Owner
  # code goes here
  @@all = []
  attr_accessor :dog, :cat
  attr_writer 
  attr_reader :name, :species
  def initialize(name, species = "human")
    @name = name
    @species = species
    save
  end
  def say_species
    "I am a #{@species}."
  end
  def save
  @@all << self
  end
  def self.all
    @@all
  end
  def self.count
    @@all.length
  end
  def self.reset_all
    @@all.clear
  end

  def cats
    #binding.pry
    Cat.all.find_all do |cat|
      cat.owner == self
    end
  end
  def dogs
    Dog.all.find_all do |dog|
      dog.owner == self
    end
  end
  def buy_cat(name)
    #binding.pry
    Cat.new(name, self)
   end
  def buy_dog(name)
    Dog.new(name, self)
  end
  def walk_dogs
    self.dogs.collect {|dog| dog.mood = "happy"}
  end
  def feed_cats
    self.cats.collect {|cat| cat.mood = "happy"}
  end
  def sell_pets
  
    self.cats.collect {|cat| cat.mood = "nervous"}
    self.dogs.collect {|dog| dog.mood = "nervous"}
    self.dogs.collect {|dog| dog.owner = nil}
    self.cats.collect {|cat| cat.owner = nil}
  end
  def list_pets
   # binding.pry
    "I have #{self.dogs.length} dog(s), and #{self.cats.length} cat(s)."
  end

end