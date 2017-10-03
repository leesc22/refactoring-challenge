# extract_variable.rb
#https://refactoring.com/catalog/extractVariable.html

def length_more_than_three(string)
	string.length > 3
end

def length_less_than_eight(string)
	string.length <= 7
end

def starts_with_vowel(string)
	string.downcase.start_with?("a", "e", "i", "o", "u")
end


username = "Alice"

if ( length_more_than_three(username) && length_less_than_eight(username) || starts_with_vowel(username) )
	puts "Congratulations #{username}! You won 1 million dollars!"
else
	puts "Please try again!"
end

