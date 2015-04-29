TwoDimList := Object clone
TwoDimList list1 := List clone
TwoDimList dim := method(x,y,
	obj := TwoDimList clone
	obj list1 = list() setSize(y)
	obj list1 foreach(index, element, obj list1 atPut(index, list() setSize(x)))
	return obj
)
TwoDimList set := method(x,y,value,
	self list1 at(y) atPut(x, value)
)
TwoDimList get := method(x,y,
	self list1 at(y) at(x)
)
TwoDimList transpose := method(
	obj := TwoDimList clone
	y := self list1 size
	x := self list1 at(0) size
	obj list1 = list() setSize(x)
	obj list1 foreach(index, element, obj list1 atPut(index, list() setSize(y)))
	for(i,0,x-1,
		for(j,0,y-1,obj set(j,i, self get(i,j)))
	)
	return obj
)
TwoDimList saveToFile := method(filename,
	f := File with(filename)
	f openForUpdating
	list1 foreach(index1, el1, 
		el1 foreach(index2, el2, 
			if(index2 != el1 size -1, f write(el2 asString,"\t"), f write(el2 asString))
		)
		if(index1 != list1 size -1, f write("\n"))
	)
)
TwoDimList readFromFile := method(filename,
	f := File with(filename)
	f openForReading
	obj := TwoDimList clone
	lines := f readLines
	obj list1 = list() setSize(lines size)
	lines foreach(index,line, obj list1 atPut(index,line split))
	obj
)
TwoDimList println := method(
	list1 foreach(el1, el1 foreach(el2, write(el2,"\t"));writeln);
)

arr := TwoDimList dim(5,3)
arr set(1,2,"value")
arr set(0,0,"first")
arr set(4,2,"last")
arr set(2,1,"middle")
arr println

writeln
writeln

arr transpose println
arr saveToFile("output.txt")
TwoDimList readFromFile("output.txt") println
