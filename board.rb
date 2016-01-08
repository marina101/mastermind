class Board
  
  attr_accessor :guess, :list, :contents, :score, :candidates

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
  end

  def showBoard
    puts "\n The right answer is #{@contents.to_s}\n"
  end

  def victory?(num)
    return true if num == 4
    false
  end
end