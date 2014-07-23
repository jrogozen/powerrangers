class Person
	attr_accessor :name, :caffeine_level

	def initialize(name)
		@name = name
		@caffeine_level = rand(0..150)
		puts "#{@name} has been initialized with a caffeine level of #{@caffeine_level}!"
	end

	def run
		if @caffeine_level > 150
			puts "#{@name} runs at a completely non-sustainable speed!"
		elsif @caffeine_level > 80
			puts "#{@name} runs like the wind!"
		else
			puts "#{@name} is barely moving. Needs more energy."
		end
	end

	def scream
		if @caffeine_level > 100
			puts "#{@name}: AAAAAAAAAaahAaAaaaaaaaaaaaAH."
		else
			puts "#{@name}: ahh."
		end
	end

	#set number of cups of coffee to drink
	def drink_coffee(cups=1)
		cups.times do
			@caffeine_level += rand(0..20)
		end
		puts "#{@name} drank #{cups} cup(s) of coffee and has a caffeiene level of #{@caffeine_level}"
		if @caffeine_level > 200
			puts "#{@name} has reached caffeine critical mass."
		elsif @caffeine_level > 100
			puts "#{@name} is excited."
		else
			puts "#{@name} could use a Redbull."
		end
	end

	def show_caffeine_level
		p @caffeine_level
	end

end

class PowerRanger < Person
	attr_accessor :strength, :color

	def initialize(name, color="green")
		super(name)
		@color = color
		@strength = rand(1..15)
		puts "#{@name} is a #{@color.capitalize} Power Ranger!"
	end

	def show_strength
		p @strength
	end

	#requires variable name, not string name
	def punch(person)
		if caffeine_level > 0
			@punch_strength = rand(0..@strength)
			if @punch_strength > 5
				@caffeine_level -= 50
				puts "#{self.name} punches #{person.name.capitalize} so hard he does sumersaults in the air!"
			else 
				puts "#{self.name} punches #{person.name.capitalize} so hard he screams and runs away in an extremely un-flattering anner."
			end
		else
			puts "#{self.name} needs more caffeine to punch. Try drinking coffee."
		end

		#reset caffeine level to zero if it's below
		if @caffeine_level < 0 
			@caffeine_level = 0
		end
	end

	def use_megazord(person)
		if @caffeine_level > 50
			@punch_strength = 5000
			puts "The unparalleled wrath of megazord has been unleashed by #{self.name}!"
			if rand(0..10) > 5
				#set target person's caffeine to zero
				person.caffeine_level = 0
				puts "#{person.name} is reduced to rubble."
			else 
				puts "#{person.name} dodges! Bummer."
			end
			#drain all energy
			@caffeine_level = 0
			puts "#{self.name} sure seems tired. Get this guy some coffee!"
		else
			puts "#{self.name} is too tired to use the awesome megazord. Drink more coffee or take a rest."
		end
	end

	#rest sets caffeine to baseline and adds strength
	def rest(hours)
		#permanently add strength up to a point
		hours.times do
			if @strength < 20
				@strength += rand(0..3)
				puts "#{self.name} feels stronger!"
			end
		end
		@caffeine_level = 51
	end

end

class EvilNinja < Person
	attr_accessor :strength, :evilness

	def initialize(name, evilness=1)
		super(name)
		@strength = rand(1..15)
		@evilness = evilness
		puts "#{@name} is a level #{@evilness} evil ninja."
	end

	def show_evilness
		p @evilness
	end

	#requires variable name, not string name
	def punch(person)
		if caffeine_level > 0
			@punch_strength = rand(0..@strength)
			if @punch_strength > 5
				@caffeine_level -= 50
				puts "#{self.name} punches #{person.name.capitalize} so hard he does sumersaults in the air!"
			else 
				puts "#{self.name} punches #{person.name.capitalize} so hard he screams and run away in an extremely unflattering manner."
			end
		else
			puts "#{self.name} needs more caffeine to punch. Try drinking coffee."
		end

		#reset caffeine level to zero if it's below
		if @caffeine_level < 0 
			@caffeine_level = 0
		end
	end

	#drain caffeine level of person (not string) to zero
	def cause_mayhem(person)
		if person.caffeine_level > 0
			person.caffeine_level = 0
			puts "#{person.name} has had his caffeine level drained to zero! Bummer."
		else
			puts "#{person.name} already has less than zero caffeine!"
		end
	end
end

# jon = Person.new("Jon")
# jon.caffeine_level = 10
# jon.run
# jon.scream
# jon.drink_coffee(4)
# jon.run

# mike = PowerRanger.new("Mike")
# mike.show_strength
# mike.punch(jon)
# mike.drink_coffee
# mike.use_megazord(jon)
# mike.use_megazord(jon)
# mike.rest(2)
# mike.use_megazord(jon)

# tommy = EvilNinja.new("tommy", 3)

#fight scene
def fight_scene
	jason = PowerRanger.new("Jason", "Red")
	tommy = PowerRanger.new("tommy", "Green")
	jon = Person.new("Jon")
	howard = Person.new("Howard")
	evilGuy_a = EvilNinja.new("Evil Guy 1")
	evilGuy_b = EvilNinja.new("Evil Guy 2")

	puts "Two innocent bystanders are attacked by evil ninjas."
	jon.scream
	howard.scream
	jon.run
	howard.drink_coffee
	howard.run

	puts "The Power Rangers arrive!"
	jason.punch(evilGuy_a)
	tommy.punch(evilGuy_b)
	jason.rest(2)
	tommy.drink_coffee

	puts "The Evil Ninjas fight back."
	evilGuy_a.punch(tommy)
	evilGuy_b.punch(tommy)
	evilGuy_a.cause_mayhem(jason)

	puts "The Power Rangers try Megazord"
	jason.use_megazord(evilGuy_a)
	evilGuy_a.punch(jason)

	puts "Cmon Tommy!"
	tommy.use_megazord(evilGuy_a)
	tommy.drink_coffee(10)
	tommy.use_megazord(evilGuy_b)

	puts "Did the Power Rangers save the day?"

	ninja_array = [evilGuy_a, evilGuy_b]
	win = "yes"

	ninja_array.each do |ninja|
		# p ninja.show_caffeine_level
		if ninja.caffeine_level > 0
			win = "no"
		end
	end

	if win == "yes"
		puts "Yes!"
	else
		puts "No :(."
	end

end

fight_scene