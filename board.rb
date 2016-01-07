class Board
  attr_accessor :guess, :list, :contents, :score, :candidates

  def initialize
    @contents = [Board.generateColor, Board.generateColor, Board.generateColor, Board.generateColor]
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

  def Board.generateColor
    number = rand(6)
    case number
    when 0
      return color = "red"
    when 1
      return color = "yellow"
    when 2
      return color = "green"
    when 3
      return color = "blue"
    when 4
      return color = "orange"
    when 5 
      return color = "purple"
    end
  end

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

  def valid?(color)
    validOptions = ['red', 'yellow', 'green', 'blue', 'orange', 'purple']
    if validOptions.include?(color)
      return true
    else 
      return false
    end
  end

  #checks the guess and calculated number of pegs for the guess
  #if codebreaker is human returns output to screen, otherwise returns score to comp
  def checkGuess(player, guess, answer, test=false)
    temp = Array.new(guess)
    cont = Array.new(answer)
    @blackPegs = 0
    @whitePegs = 0

    if temp[0] == cont[0]
      value = temp[0]
      @blackPegs += 1
      temp[0] = nil
      cont[0] = nil
    end
    if temp[1] == cont[1]
      @blackPegs += 1
      temp[1] = nil
      cont[1] = nil
    end
    if temp[2] == cont[2]
      @blackPegs += 1
      temp[2] = nil
      cont[2] = nil
    end
    if temp[3] == cont[3]
      @blackPegs += 1
      temp[3] = nil
      cont[3] = nil
    end

    temp.compact!
    cont.compact!

    temp.each do |g|
      if cont.include?(g)
        @whitePegs += 1 
        index = cont.index(g)
        cont.delete_at(index)
        cont.compact!
      end
    end

    @score = [@blackPegs, @whitePegs]

    if(player == "human")
      #displays status to player
      if victory?(@blackPegs)
        puts "Congratulations! You won!"
        return true
      else
        puts "\nYour guess resulted in #{@blackPegs} black pegs and #{@whitePegs} white pegs.\n"
        return false
      end  
    elsif (!test) #if player is computer
      if victory?(@blackPegs)
        puts "Congratulations Computer, you have won!"
        return true
      else
        puts "Your guess resulted in #{@blackPegs} black pegs and #{@whitePegs} white pegs.\n"
        return false
      end  
    else
      return @score
    end

  end

  def showBoard
    puts "\n #{@contents.to_s}\n"
  end

  def victory?(num)
    return true if num == 4
    false
  end

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

end