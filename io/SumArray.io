SumTwoDimArray := method(twoDimArray,
	sum := 0
	twoDimArray foreach(arr, sum = sum + (arr sum))
)

twoDimArray := list(list(1,2,3),list(4,5,6),list(7,8,9))

SumTwoDimArray(twoDimArray) println
