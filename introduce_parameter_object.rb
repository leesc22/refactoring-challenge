# introduce_parameter_object.rb
#http://refactoring.com/catalog/introduceParameterObject.html

# Replace Parameter with Method Call
# http://ieftimov.com/refactoring-smelly-parameters-lists

class GamePackageCalculator

	BASIC_PACKAGE_FACTOR = 1.0
	PREMIUM_PACKAGE_FACTOR = 2.1
	BASIC_RATE = 1
	PREMIUM_RATE = 2
	GOLD_LIFE_RATIO = 0.2
	POWERUPS_LIFE_RATIO = 0.5


	#calculates the cost of a gamer who wants to get X gold, Y powerup and number of lives derived from X gold and Y powerup. 
	def calculate_cost(package, premium = nil)
		lives = calculate_lives(package) 
		
		if premium
			premium_cost(lives, package) 
		else
			basic_cost(lives, package)
		end
	end	

	private 

	def calculate_lives(package)
		(package.gold * GOLD_LIFE_RATIO ).round(0) + (package.powerups * POWERUPS_LIFE_RATIO).round(0) 
	end


	def premium_cost(lives, package)
		PREMIUM_PACKAGE_FACTOR * lives + PREMIUM_RATE * (package.gold + package.powerups)
	end

	def basic_cost(lives, package)
		BASIC_PACKAGE_FACTOR * lives + BASIC_RATE * (package.gold + package.powerups)
	end

end


class Package
	attr_reader :gold, :powerups

	def initialize(gold, powerups)
		@gold = gold
		@powerups = powerups
	end
end

package1 = Package.new(gold = 10, powerups = 2)
game1 = GamePackageCalculator.new
p game1.calculate_cost(package1) # 15.0
p game1.calculate_cost(package1, true) # 30.3
