class Owner
	attr_accessor :name, :pets
	attr_reader :species

@@all = []

	def initialize(species)
		self.class.all << self
		@species = species
		self.pets = {:fishes => [], :dogs => [], :cats => []}
	end

	def self.count
		self.all.count
	end

	def say_species
		"I am a #{self.species}."
	end

	def self.all
		@@all
	end

	def buy_fish(name)
		self.pets[:fishes] << Fish.new(name)
	end

	def buy_cat(name)
		self.pets[:cats] << Cat.new(name)
	end

	def buy_dog(name)
		self.pets[:dogs] << Dog.new(name)
	end

	def self.reset_all
		self.all.clear
	end

	def walk_dogs
		self.pets[:dogs].each {|dog| dog.mood = "happy"}
	end

	def play_with_cats
		self.pets[:cats].each {|cat| cat.mood = "happy"}
	end

	def feed_fish
		self.pets[:fishes].each {|fish| fish.mood = "happy"}
	end

	def count(pet)
		self.pets[pet].count
	end

	def sell_pets
		self.pets.values.flatten.each {|pet| pet.mood = "nervous"}
		self.pets = {:fishes => [], :dogs => [], :cats => []}
	end


	def list_pets
		number_of_pets = self.pets.map {|pet| pet.count}
		"I have #{self.count(:fishes)} fish, #{self.count(:dogs)} dog(s), and #{self.count(:cats)} cat(s)."
	end

end