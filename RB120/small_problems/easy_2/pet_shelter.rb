
class Pet 
	attr_reader :name
	attr_accessor :animal
	def initialize(animal, name)
		@animal = animal
		@name = name
	end

	def to_s
		"A #{animal} named #{name}."
	end
end

class Owner
	attr_accessor :name
	attr_accessor :number_of_pets
	
	def initialize(name)
		@name = name
		@number_of_pets = 0
	end
end

class Shelter
	attr_accessor :adoptions, :shelter_name
	def initialize(shelter_name)
		@shelter_name = shelter_name
		@adoptions = {}
		@shelter_pets = []
	end

	def number_of_pets
		@shelter_pets.size
	end

	def add_pet(animal)
		@shelter_pets << animal
	end

	def print_shelter_pets
		puts "The #{shelter_name} has the following pets:"
		puts @shelter_pets
		puts
	end

	def adopt(owner, pet)
		if adoptions.has_key?(owner.name)
			adoptions[owner.name] << pet
			@shelter_pets.delete(pet)
		else
			adoptions[owner.name] = [pet]
			@shelter_pets.delete(pet)
		end

		owner.number_of_pets += 1
	end

	def print_adoptions
		adoptions.each do |owner, pet|
			puts "#{owner} has the following pets:"
			pet.each do |value|
				puts value
			end
			puts
		end
	end
end

butterscotch = Pet.new('cat', 'Butterscotch')
pudding      = Pet.new('cat', 'Pudding')
darwin       = Pet.new('bearded dragon', 'Darwin')
kennedy      = Pet.new('dog', 'Kennedy')
sweetie      = Pet.new('parakeet', 'Sweetie Pie')
molly        = Pet.new('dog', 'Molly')
chester      = Pet.new('fish', 'Chester')
bloopus  		 = Pet.new('cat', 'Bloopus')
asta 				 = Pet.new('dog', 'Asta')
laddie       = Pet.new('dog', 'Laddie')
fluffy       = Pet.new('cat', 'Fluffy')
kat          = Pet.new('cat', 'Kat')
ben          = Pet.new('cat', 'Ben')
chatterbox   = Pet.new('parakeet', 'Chatterbox')
bluebell     = Pet.new('parakeet', 'Bluebell')


phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')
saba = Owner.new('Saba')

shelter = Shelter.new("Animal Shelter")

shelter.add_pet(butterscotch)
shelter.add_pet(pudding)
shelter.add_pet(darwin)
shelter.add_pet(kennedy)
shelter.add_pet(sweetie)
shelter.add_pet(molly)
shelter.add_pet(chester)
shelter.add_pet(bloopus)
shelter.add_pet(asta)
shelter.add_pet(laddie)
shelter.add_pet(fluffy)
shelter.add_pet(kat)
shelter.add_pet(ben)
shelter.add_pet(chatterbox)
shelter.add_pet(bluebell)

shelter.adopt(phanson, butterscotch)
shelter.adopt(phanson, pudding)
shelter.adopt(phanson, darwin)
shelter.adopt(bholmes, kennedy)
shelter.adopt(bholmes, sweetie)
shelter.adopt(bholmes, molly)
shelter.adopt(bholmes, chester)
shelter.adopt(saba, bloopus)
shelter.print_adoptions

shelter.print_shelter_pets

puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."
puts "#{saba.name} has #{saba.number_of_pets} adopted pets."
puts "The #{shelter.shelter_name} has #{shelter.number_of_pets} unadopted pets."