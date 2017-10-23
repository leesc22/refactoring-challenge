# introduce_parameter_object.rb
#http://refactoring.com/catalog/introduceParameterObject.html

# Replace Parameter with Method Call
# http://ieftimov.com/refactoring-smelly-parameters-lists

class GamePackageCalculator

	BASIC_PACKAGE_FACTOR = 1.0
	PREMIUM_PACKAGE_FACTOR = 2.1
	BASIC_RATE = 1
	PREMIUM_RATE = 2

	#calculates the cost of a gamer who wants to get X gold, Y powerup and number of lives derived from X gold and Y powerup. 
	def calculate_cost(package, premium = nil)
		premium ? premium_cost(package) : basic_cost(package)
	end	

	private 

	def premium_cost(package)
		PREMIUM_PACKAGE_FACTOR * package.lives + PREMIUM_RATE * (package.gold + package.powerups)
	end

	def basic_cost(package)
		BASIC_PACKAGE_FACTOR * package.lives + BASIC_RATE * (package.gold + package.powerups)
	end

end


class Package

	GOLD_LIFE_RATIO = 0.2
	POWERUPS_LIFE_RATIO = 0.5

	attr_reader :gold, :powerups, :lives

	def initialize(gold, powerups)
		@gold = gold
		@powerups = powerups
		@lives = calculate_lives
	end

	private

	def calculate_lives
		(@gold * GOLD_LIFE_RATIO ).round(0) + (@powerups * POWERUPS_LIFE_RATIO).round(0)
	end
	
end

package1 = Package.new(gold = 10, powerups = 2)
game1 = GamePackageCalculator.new
p game1.calculate_cost(package1) # 15.0
p game1.calculate_cost(package1, true) # 30.3
