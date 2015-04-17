iterativeFib := method(n,
	if(n==1 or n==2, return 1);
	n1 := 1
	n2 :=1
	for(i,3,n, tmp := n1;n1=n2+n1;n2=tmp)
	return n1
)

recursiveFib := method(n,
	if(n==1 or n==2, return 1, return recursiveFib(n-1) + recursiveFib(n-2));
)

iterativeFib(10) println
recursiveFib(10) println
