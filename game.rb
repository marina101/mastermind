
class Game
  require_relative 'board'
  require_relative 'ai'
  require_relative 'human'

  puts "Welcome to MasterMind!\n
    In this game, the codesetter sets a code of four colours (there are 
    six color possibilities for each of the four). The code-breaker 
    has twelve turns to try to guess the correct colors and their sequence.
    Each turn, the code-breaker takes a guess at the four. For every guess 
    that includes both a correct color and its placement, a black peg is 
    given. If the code-breaker has guessed a color that is present in the 
    sequence but did not guess the correct place for it, a white peg is 
    given. The game is won if all four colors are guessed in the right 
    order before the turns run out. \n Good luck! \n"
  finished = false

  while (!finished) do 
    puts "Would you like to play as the codebreaker or as code-setter? 
    Please enter 'breaker' or 'setter':"
    answer = gets.chomp
    comp_first = true
    

    if answer == "breaker"
      board = Board.new
      board.showBoard
      12.times do
        board.askGuess
        break if board.checkGuess("human", board.guess, board.contents)
        board.showBoard
      end
    elsif answer == "setter"
      board = Ai.new
      win = false
      board.setBoard
      board.showBoard
      12.times do 
        if(comp_first)
          board.comp_first_guess
          comp_first=false
        else
          board.comp_guess
        end
      
      end
    end
    puts "Do you want to play again? Type 'y' if yes, any other key to quit"
    play_again = gets.chomp
    finished = true unless play_again.downcase == 'y'
  end


end