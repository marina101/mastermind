class Board

  def initialize
    @contents = [Board.generateColor, Board.generateColor, Board.generateColor, Board.generateColor]
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
        puts "There was a problem with your input. Please try again with correct input"
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

  def checkGuess
    temp = Array.new(@guess)
    cont = Array.new(@contents)
    blackPegs = 0
    whitePegs = 0

    if temp[0] == cont[0]
      value = temp[0]
      blackPegs += 1
      temp[0] = nil
      cont[0] = nil
    end
    if temp[1] == cont[1]
      blackPegs += 1
      temp[1] = nil
      cont[1] = nil
    end
    if temp[2] == cont[2]
      blackPegs += 1
      temp[2] = nil
      cont[2] = nil
    end
    if temp[3] == cont[3]
      blackPegs += 1
      temp[3] = nil
      cont[3] = nil
    end

    temp.compact!
    cont.compact!
    puts "\nafter ifs before WP, temp is #{temp.to_s} and cont is #{cont.to_s}\n"

    temp.each do |g|
      if cont.include?(g)
        whitePegs += 1 
      end
    end

    #displays status to player
    if victory?(blackPegs)
      puts "Congratulations! You won!"
      return true
    else
      puts "\nYour guess resulted in #{blackPegs} black pegs and #{whitePegs} white pegs.\n"
      return false
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
      puts "Please choose the fourth colori n the sequence:"
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