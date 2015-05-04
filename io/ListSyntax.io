squareBrackets := method(
	r := List clone
	call message arguments foreach(arg, r append(doMessage(arg)))
	r
)


[1,3,2,3,4,"abc",4+2] println
