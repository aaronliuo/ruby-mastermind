require_relative './game.rb'
require_relative './player.rb'
require_relative './computer.rb'


def maker()
    player = Player.new()
    computer = Computer.new()
    game = MastermindGame.new()
    game.valid_code = player.input_code()
    while game.turns < MastermindGame.MAX_TURNS do
        puts "Turn #{game.turns+1}"
        puts "Computer Guess: #{computer.comp_guess}"
        result = game.check_guess(computer.comp_guess)
        computer.filter_possibilities(result)
        game.print_result(result, "Computer")
    end

end

def guesser()
    player = Player.new()
    computer = Computer.new()
    game = MastermindGame.new()
    game.valid_code = computer.generate_code()
    while game.turns < MastermindGame.MAX_TURNS do
        puts "Turn #{game.turns+1}"
        game.print_result(game.check_guess(player.input_code()), "The player")
    end
end

def run_game()
    puts "Welcome to Mastermind."
    puts "This is a game where a player has to correctly guess a 4-digit code that another player has set!
The digits are from a range of 6 numbers (1-6 inclusive). After each guess, the guesser gets to
recieve some hints in a form of a string of numbers. You will be playing against a computer.\n\n"
    puts "Hints"
    puts "0: Represents that one number is not in its correct position but it exists."
    puts "1: Represents that one number is in its correct position."
    while true do
        puts "Press 'y' to play and 'n' to quit."
        can_play = gets.chomp
        until can_play.match?(/^y$|^n$/) do
            puts "Invalid input"
            puts "Press 'y' to play or 'n' to quit."
            can_play = gets.chomp
        end

        if can_play == 'n'
            break
        end

        print "Press 1 to be the Code Maker or Press 2 to be the Guesser: "
        response = gets.chomp
        until response.match?(/^1$|^2$/) do
            puts "Invalid input"
            print "Press 1 to be the Code Maker or Press 2 to be the Guesser: "
            response = gets.chomp
        end 

        if response == '1'
            maker()
        else
            guesser()
        end
    end
end

run_game()
    