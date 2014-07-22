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
end

class PowerRanger < Person
	attr_accessor :strength, :color

	def initialize(name, color="green")
		super(name)
		@color = color
		@strength = rand(1..15)
		puts "#{@name} is a #{@color.capitalize} Power Ranger!"
	end

	def show_caffeine_level
		p @caffeine_level
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
				puts "#{person.name.capitalize} got punched so hard he's doing sumersaults in the air!"
			else 
				puts "#{person.name.capitalize} got punched. #{person.name} screams and runs away in an extremely un-manly manner."
			end
		else
			puts "Need more caffeine to punch. Try drinking coffee."
		end

		#reset caffeine level to zero if it's below
		if @caffeine_level < 0 
			@caffeine_level = 0
		end
	end

	def use_megazord(person)
		if @caffeine_level > 50
			@punch_strength = 5000
			puts "The unparalleled wrath of megazord has been unleashed!"
			if rand(0..10) > 5
				puts "#{person.name} is reduced to rubble."
			else 
				puts "#{person.name} dodges! Bummer."
			end
			#drain all energy
			@caffeine_level = 0
			puts "#{self.name} sure seems tired. Get this guy some coffee!"
		else
			puts "Too tired to use the awesome megazord. Drink more coffee or take a rest."
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

class EvilNinja
end

jon = Person.new("Jon")
jon.caffeine_level = 10
jon.run
jon.scream
jon.drink_coffee(4)
jon.run

mike = PowerRanger.new("Mike")
mike.show_strength
mike.punch(jon)
mike.drink_coffee
mike.use_megazord(jon)
mike.use_megazord(jon)
mike.rest(2)
mike.use_megazord(jon)