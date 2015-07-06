//Defines static class variables
object TicTacToe {
  val blank = ' '
  val x = 'X'
  val o = 'O'
  val tieGame = 'T'
  val notFinished = 'N'
}
//This clas will represent the Tic-Tac-Toe TicTacToe
class TicTacToe(var board : Array[Char]) {
  assert(board != null && board.length > 0, "TicTacToe size must be greater than 0")
  val size = Math.sqrt(board.length).toInt
  assert((size*size) == board.length, "TicTacToe must be nxn")
  assert(board.forall(el => el == TicTacToe.blank || el == TicTacToe.x || el == TicTacToe.o), 
    "unexpected piece on board")

  def this(size : Int) {
    //additional constructors need to call another contructer as 1st statement
    this(Array[Char]().padTo(size*size, TicTacToe.blank))
  }

  //This method will print the Tic Tac Toe TicTacToe
  def printBoard() = {
    for(i <- 0 until size*size by size) {
      for(j <- 0 until size) {
        var c = if(board(i+j) == TicTacToe.blank) (i+j).toString else board(i+j).toString
        c = c.padTo((size*size-1).toString.length, ' ')
        print(c+(if(j==size-1) "" else "|"))
      }
      println
    }
  }

  def resetBoard() = {
    board = Array[Char]().padTo(size*size, TicTacToe.blank)
  }

  //This game will play a game of Tic Tac Toe
  def playGame() = {
    resetBoard
    var xTurn = true
    //Keep playing will game is not finished
    while(validateBoard == TicTacToe.notFinished) {
      println
      printBoard
      if(xTurn)
        print("Player X move: ")
      else
        print("Player O move: ")
      var move = scala.io.StdIn.readInt
      if (move >=0 && move < size*size && board(move) != TicTacToe.blank) {
        println("Invalid move")
      }
      else {
        board(move) = if (xTurn) TicTacToe.x else TicTacToe.o
        xTurn = !xTurn
      }
    }

    //Print result of game
    println
    printBoard
    var result = validateBoard()
    if (result == TicTacToe.x)
      println("Player X won the game!!!")
    if (result == TicTacToe.o)
      println("Player O won the game!!!")
    if (result == TicTacToe.tieGame)
      println("The game ended in a tie")
  }

  //detect winner or whether there is a tie or no winner yet
  def validateBoard(): Char = {
    var owin = true
    var xwin = true
    for(i <- 0 until size) {
      //validate rows
      owin = true
      xwin = true
      for(j <- size * i until size * (i+1)) {
        owin = owin && board(j) == TicTacToe.o
        xwin = xwin && board(j) == TicTacToe.x
      }
      if (xwin)
        return TicTacToe.x
      if (owin)
        return TicTacToe.o

      //validate cols
      owin = true
      xwin = true
      for(j <- i until size*size by size) {
        owin = owin && board(j) == TicTacToe.o
        xwin = xwin && board(j) == TicTacToe.x
      }
      if (xwin)
        return TicTacToe.x
      if (owin)
        return TicTacToe.o
    }
    //validate diagonal 1
    owin = true
    xwin = true
    for(i <- 0 until size*size by size) {
        owin = owin && board(i) == TicTacToe.o
        xwin = xwin && board(i) == TicTacToe.x
    }
    if (xwin)
      return TicTacToe.x
    if (owin)
      return TicTacToe.o

    //validate diagonal 2
    owin = true
    xwin = true
    for(i <- size-1 until size*size-1 by size-1) {
        owin = owin && board(i) == TicTacToe.o
        xwin = xwin && board(i) == TicTacToe.x
    }
    if (xwin)
      return TicTacToe.x
    if (owin)
      return TicTacToe.o

    //no winner yet
    board.foreach(el => if(el == TicTacToe.blank) return TicTacToe.notFinished)

    //tie game
    return TicTacToe.tieGame
  }
}

if (args.length != 1) {
  println("Usage: specify 1 argument for board size")
  System.exit(1)
}
var game = new TicTacToe(args(0).toInt)
game.playGame()
