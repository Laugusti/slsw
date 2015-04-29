numberOfGuesses := 10
lowerBound := 1
upperBound := 100

writeln("You have ", numberOfGuesses, " attempts to guess the secret # (between ",
	lowerBound, " and ", upperBound, ")")

//Generate a random number between lowerBound and upperBound 
secret := Random value(lowerBound,upperBound+1) floor

lastGuess := nil
while((numberOfGuesses = numberOfGuesses -1) >= 0,
	"Guess the secret #: " print
	currentGuess := File standardInput readLine asNumber
	if(currentGuess == secret, 
		lastGuess = currentGuess
		break
	)
	if(lastGuess != nil, 
		diff := (lastGuess - secret) abs - (currentGuess - secret) abs
		if(diff > 0, "Hotter", "Colder") println
	)
	lastGuess = currentGuess
)

if(lastGuess == secret,
	"Hooray, you've guess the secret #!!!1",
	"You failed to guess the secret :(") println

writeln("The secret # was ", secret)

