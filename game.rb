
#driver class of the game - explains rules and runs control flow based on whether
#the player is human or AI
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
    begin
      puts "Would you like to play as the codebreaker or as code-setter? 
      Please enter 'breaker' or 'setter':"
      answer = gets.chomp
      comp_first = true
      win = false

      #if a human will be guessing code
      if answer == "breaker"
        board = Human.new
        12.times do
          board.askGuess
          win = board.checkGuess("human", board.guess, board.contents)
          break if win  
        end
      puts "Sorry, you have run out of turns" if !win
      board.showBoard

      #if AI will be guessing code
      elsif answer == "setter"
        board = Ai.new
        
        board.setBoard
        12.times do 
          if(comp_first)
            win = board.comp_first_guess
            comp_first=false
          else
            win = board.comp_guess
          end
        break if win
        end
        puts "Sorry computer, you have run out of turns" if !win
        board.showBoard
      else
        raise ArgumentError, "Please enter valid input"
      end
      puts "Do you want to play again? Type 'y' if yes, any other key to quit"
      play_again = gets.chomp
      finished = true unless play_again.downcase == 'y'
    rescue => e
      puts e
    end
  end


end