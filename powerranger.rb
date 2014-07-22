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
		puts "#{@name} is a #{@color.capitalize} Power Ranger!"
	end

	def show_caffeine_level
		p @caffeine_level
	end

end

class EvilNinja
end

# jon = Person.new("Jon")
# jon.caffeine_level = 10
# jon.run
# jon.scream
# jon.drink_coffee(4)
# jon.run

mike = PowerRanger.new("Mike")