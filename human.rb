class Human < Board
  require_relative 'board'

  def askGuess
    valid = false
    while (!valid)
      puts "The choices are: 'red' 'yellow' 'green' 'blue' 'orange' 'purple';\n
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


end