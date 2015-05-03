//create new assignment operator; replaces ':' with 'atPutNumber'
//i.e. "string1" : "string2" becomes atPutNumber(""string1"","string2")
OperatorTable addAssignOperator(":", "atPutNumber")

//parser call curlyBrackets whenever it encounters '{}'
//this method will create a Map and will pass each argument as a message to the created Map
curlyBrackets := method(
	r := Map clone
	call message arguments foreach(arg,
		r doMessage(arg)
	)
	r
)

//create slot 'atPutNumber' for Map prototype
//this method will add an entry to map using the arguments as the key/value pair
Map atPutNumber := method(
	self atPut(
		call evalArgAt(0) asMutable removePrefix("\"") removeSuffix("\""),
		call evalArgAt(1)
	)
)

s := File with ("phonebook.txt") openForReading contents
phoneNumbers := doString(s)
phoneNumbers keys println
phoneNumbers values println
