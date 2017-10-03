#extract_method.rb
#use this as tips for the first one : http://refactoring.com/catalog/extractMethod.html

def min_length(string)
	string.length > 3
end

def max_length(string)
	string.length <=10
end

def starts_with_letters(string, *letters)
	letters.include?(string[0].downcase)
end

def check_username(string, *letters)
	( min_length(string) && max_length(string) ) ||  starts_with_letters(string, *letters)
end

def print_message(string, *letters, amount)
	if check_username(string, *letters)	
		puts "Congratulations #{string}! You won #{amount} dollars!"
	else
		puts "Thanks for joining!"
	end
end

username = "Alice"
print_message(username, "a", "e", "i", "o", "u", 10)

username = "Bobby"
print_message(username, "b", "g", "l", "p", 50)

username = "Xena"
print_message(username, "q", "u", "x", "y", "z", 100)
