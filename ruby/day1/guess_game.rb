MAX_NUM = 10

puts "Guess a number between 0 an #{MAX_NUM}"
n = rand(MAX_NUM)

count = 1
guess = gets
while not guess.to_i == n
	if guess.to_i > n
		puts 'guess lower' 
	else
		puts 'guess higher'
	end
	guess = gets
	count+=1
end


puts "Got answer in #{count} tries"
