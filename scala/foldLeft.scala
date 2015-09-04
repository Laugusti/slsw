/*Computes the total size of list of strings
 * @param strList a list of strings
 * @return the total size of the list of strings
 */
def sizeOfStringList(strList:List[String]):Int = {
  strList.foldLeft(0)((sum, str) => sum + str.length)
}

/*Return the total size of all program arguments*/
println(sizeOfStringList(args.toList))
