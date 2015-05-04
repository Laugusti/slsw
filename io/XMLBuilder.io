XMLBuilder := Object clone
XMLBuilder indentLevel := 0
XMLBuilder forward := method(
	for(i,1,indentLevel,"  " print)
	writeln("<", call message name, ">")
	indentLevel = indentLevel + 1
	call message arguments foreach(arg,
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
XMLBuilder ul(
	li("Io"),
	li("Lua"),
	li("JavaScript"),
	li(other("Python","Ruby","Perl"))
)
