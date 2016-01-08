class Human < Board
  require_relative 'board'
  require 'rubygems'
  require 'terminal-display-colors'

  #asks the human to make a guess
  def askGuess
    valid = false
    while (!valid)
      puts "The choices are: #{'red'.bright_red} #{'yellow'.bright_yellow} #{'green'.green} #{'blue'.cyan} #{'orange'.red} #{'purple'.magenta};\n
      Please enter your guess for the first color:"
      c1 = gets.chomp 
      puts "Please enter your guess for the second color:"
      c2 = gets.chomp
      puts "Please enter your guess for the third color:"
      c3 = gets.chomp
      puts "Please enter your guess for the fourth color:"
      c4 = gets.chomp
      if (valid?(c1) && valid?(c2) && valid?(c3) && valid?(c4))
        valid = true
      else  
        puts "\nThere was a problem with your input. Please try again with correct input\n"
      end
    end
    @guess = [c1, c2, c3, c4]
    puts "your guess was #{@guess.to_s}"
  end

  #checks the validity of the guess
  def checkGuess(player, guess, answer, test=false)
    super(player, guess, answer, test)

    #displays status to player
      if victory?(@blackPegs)
        puts "Congratulations! You won!"
        return true
      else
        puts "\nYour guess resulted in #{@blackPegs} black pegs and #{@whitePegs} white pegs.\n"
        return false
      end  
  end


end