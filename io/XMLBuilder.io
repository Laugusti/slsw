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

XMLBuilder := Object clone
XMLBuilder indentLevel := 0
//The forward slot is called when the receiver is sent a message it doesn't recognize.
XMLBuilder forward := method(
	isMap := false
	//get type of first argument (execute in Object context and not self)
	try(isMap = Object doString(call message argAt(0) code) type == "Map")
	for(i,1,indentLevel,"  " print)
	isMap ifTrue(
		arg0 := Object doString(call message argAt(0) code)
		write("<", call message name)
                arg0 foreach(k, v, write(" ",k,"=\"",v,"\""))
                writeln(">")
	) ifFalse(
		writeln("<", call message name, ">")
	)
	indentLevel = indentLevel + 1
	call message arguments foreach(index, arg,
		if(index ==0 and isMap, continue)
		content := self doMessage(arg)
		if(content type == "Sequence",
			for(i,1,indentLevel,"  " print)
 			writeln(content)
		)
	)
	indentLevel = indentLevel - 1
	for(i,1,indentLevel,"  " print)
	writeln("</", call message name, ">")
)
r := Map clone
r atPut("key", "value")
XMLBuilder ul(
	li("Io"),
	li("Lua"),
	li("JavaScript"),
	li(other("Python","Ruby","Perl")),
	li(r),
	book({"author": "Tate"}, "Some Book")
)

writeln
writeln

XMLBuilder ul(li({"class":"selected language","id":"IoLang","style":"text-align:left"}),li("Lua"),li("Javascript"),li("Lisp"))
