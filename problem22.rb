class Problem
	include Enumerable

	def initialize
		puts "Which file would you like to read from?"
		input = gets.chomp.downcase
		if File.exist?(input)
			input_file = File.readlines(input)
			file_string = input_file.join("")
			@names = file_string.split(",").sort!
			@alphabet = ('A'..'Z').to_a
			@total = 0
			calculate
		else
			puts("Could not find file '#{input}'")
			initialize
		end
	end

	def calculate
		@names.each_with_index do |name, i|
			name_value = 0
			name_array = name.split("")
			name_array = name_array.slice(1,name_array.length-2)
			name_array.each do |letter| 
				name_value += @alphabet.index(letter) + 1
			end
			name_value = name_value*(i+1)
			@total += name_value			
		end
		puts "Answer: #{@total}"
	end

end

Problem.new



