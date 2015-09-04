/** This trait defines a censor method wich replaces designated 'curse' words
 *  specified alternates
 */
trait Censor {
  val curse_alts = Map("Shoot" -> "Pucky", "Darn" -> "Beans")

  /** Censors the string arugment
   *  @param str the string to censor
   *  @return the censored string
   */
  def censor(str:String):String = {
    str.split(" ").map(word => 
        if (curse_alts.keySet.contains(word)) curse_alts(word) else word
        ).mkString(" ")
  }
}

/** Custom string class extends the Censor traite and overrides the toString
 *  method to use the censor the string
 */
class CensorString(str: String) extends Censor {
  override def toString():String = censor(str)
}

/* Join the argumens to the program into space delimited string anc print the 
 * censored string
 */
println(new CensorString(args.mkString(" ")))
