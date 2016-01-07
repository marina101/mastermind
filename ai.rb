class Ai < Board
require_relative 'board'
  
  def setBoard
    valid = false
    while (!valid)
      puts "The choices are: 'red' 'yellow' 'green' 'blue' 'orange' 'purple';\n
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
  
  #the computer generates a list of all colour possibilites and picks one randomly for its first guess
  def comp_first_guess
    generate_all_possibilities
    index = rand(1296)
    @guess = @list[index]  
    puts "Computer's first guess is #{@guess.to_s}"
    checkGuess("computer", @guess, @contents)
    @candidates = Array.new
    oldScore = @score
    return true if oldScore == 8
    @list.each do |option|
      if checkGuess('computer', option, @guess, true) == oldScore
        @candidates.push(option)
      end
    end
  end

  def comp_guess
    size = @candidates.length
    index = rand(size)
    @guess = @candidates[index] #randomly guesses one from the list of candidates
    puts "\nComputer's guess is #{@guess.to_s}"
    checkGuess("computer", @guess, @contents)
    oldScore = @score
    return true if oldScore == 8
    @candidates = @candidates.select do |pattern|
                                        checkGuess('computer', pattern, @guess, true) == oldScore
                                    end
  end

  def generate_all_possibilities
    a = ['red ', 'yellow ', 'green ', 'blue ', 'orange ','purple ']
    @list = a.repeated_permutation(4).map(&:join)
    @list = @list.map do |phrase|
                       phrase.split(' ')
                      end
    puts "\n\n possibilities list is #{@list.length} long\n\n"
  end

end