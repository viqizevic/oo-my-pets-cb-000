class Owner

  attr_accessor :name, :pets
  attr_reader :species

  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    @pets = {:fishes => [], :dogs => [], :cats => []}
    @@all << self
  end

  def say_species
    "I am a #{species}."
  end

  def buy_fish(name)
    fish = Fish.new(name)
    pets[:fishes] << fish
  end

  def buy_cat(name)
    cat = Cat.new(name)
    pets[:cats] << cat
  end

  def buy_dog(name)
    dog = Dog.new(name)
    pets[:dogs] << dog
  end

  def walk_dogs
    pets[:dogs].each { |d| d.mood = "happy" }
  end

  def play_with_cats
    pets[:cats].each { |c| c.mood = "happy" }
  end

  def feed_fish
    pets[:fishes].each { |f| f.mood = "happy" }
  end

  def sell_pets
    pets.each do |species, animals|
      animals.each { |a| a.mood = "nervous" }
      animals.clear
    end
  end

  def list_pets
    f = pets[:fishes].size
    d = pets[:dogs].size
    c = pets[:cats].size
    "I have #{f} fish, #{d} dog(s), and #{c} cat(s)."
  end

  def self.all
    @@all
  end

  def self.reset_all
    @@all.clear
  end

  def self.count
    @@all.size
  end

end
