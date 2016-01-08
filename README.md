    #Welcome to MasterMind!
    by: MC
    
    #Rules
    In this game, the codesetter sets a code of four colours (there are six color possibilities for each of the four). The code-breaker      has twelve turns to try to guess the correct colors and their sequence. Each turn, the code-breaker takes a guess at the four. For       every guess that includes both a correct color and its placement, a black peg is given. If the code-breaker has guessed a color that     is present in the sequence but did not guess the correct place for it, a white peg is given. The game is won if all four colors are      guessed in the right order before the turns run out. Good luck!
    
    #To run the game, please run the game.rb file from the command line
    #The program uses the 'terminal-display-colors' gem
    
    #The AI algorithm is inspired from "Mastermind: An AI Approach to the Game" by Lizbeth Matos Morris, Harry Rosado Padilla and Carlos     M. Rubert Perez.
    For the first guess, the computer generates a list of all possible combinations and randomly chooses one. Once it gets the
    score for that combination (in the form of black and white pegs), it then runs each of the other possibilities against the guess
    and pushes the ones that score the same into a list of possible candidates for the answer. On subsequent turns, the list is trimmed      as only the candidates with the same score as that turn's guess are kept in the list, until only the answer remains.
    

    
