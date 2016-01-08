#This class contains the logic for the AI. It uses the following algorithm:
# 1) a list of all possibilities is generated and the AI randomly picks one
# 2) the algorithm checks all remaining possibilities against the AI guess and 
#    assigns each a score, the ones with the same score are kept in an array of candidates
# 3) on subsequent turns, the same process is repeated until the list of candidates has only
#    the correct answer remaining 
#  The AI should be able to guess the answer using less than 6 turns each time
class Ai < Board
require_relative 'board'
  
  def setBoard
    valid = false
    while (!valid)
      puts "The choices are: #{'red'.bright_red} #{'yellow'.bright_yellow} #{'green'.green} #{'blue'.cyan} #{'orange'.red} #{'purple'.magenta};\n
      Please choose the first color in the sequence:"
      c1 = gets.chomp 
      puts "Please choose the second color in the sequence:"
      c2 = gets.chomp
      puts "Please choose the third color in the sequence:"
      c3 = gets.chomp
      puts "Please choose the fourth color in the sequence:"
      c4 = gets.chomp

      if (valid?(c1) && valid?(c2) && valid?(c3) && valid?(c4))
        valid = true
      else  
        puts "There was a problem with your input. Please try again with correct input"
      end
    end
    @contents = [c1, c2, c3, c4]
  end
  
  #the computer's first guess
  def comp_first_guess
    generate_all_possibilities
    index = rand(1296)
    @guess = @list[index]  
    puts "Computer's first guess is #{@guess.to_s}"
    win = checkGuess("computer", @guess, @contents)
    @candidates = Array.new
    oldScore = @score
    return true if win
    @list.each do |option|
      if checkGuess('computer', option, @guess, true) == oldScore
        @candidates.push(option)
      end
    end
    return win
  end

  #subsequent computer guesses
  def comp_guess
    size = @candidates.length
    index = rand(size)
    @guess = @candidates[index] #randomly guesses one from the list of candidates
    puts "\nComputer's guess is #{@guess.to_s}"
    win = checkGuess("computer", @guess, @contents)
    return true if win
    oldScore = @score
    @candidates = @candidates.select do |pattern|
                                        checkGuess('computer', pattern, @guess, true) == oldScore
                                    end
    return win
  end

  #generates all possible combinations
  def generate_all_possibilities
    a = ['red ', 'yellow ', 'green ', 'blue ', 'orange ','purple ']
    @list = a.repeated_permutation(4).map(&:join)
    @list = @list.map do |phrase|
                       phrase.split(' ')
                      end
    puts "\n\n possibilities list is #{@list.length} long\n\n"
  end

  #checks the computers guess
  def checkGuess(player, guess, answer, test=false)
    
    super(player, guess, answer, test)

    if (!test) #if player is computer
      if victory?(@blackPegs)
        puts "Congratulations Computer, you have won!"
        return true
      else
        puts "Computer's guess resulted in #{@blackPegs} black pegs and #{@whitePegs} white pegs.\n"
        return false
      end  
    else
      return @score
    end
  end

end