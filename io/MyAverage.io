List myAverage := method(
	if(self isEmpty, return 0)
	self foreach(number, if(number proto != Number, Exception raise("List contains non-Number elements")))
	(self sum)/(self size)
)

list(1,2,3,4,5,6,7,8,9,10) myAverage println
list(1,2,3,4,5,6,7,8,9,"") myAverage println
