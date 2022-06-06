require_relative './game.rb'
require_relative './player.rb'
require_relative './computer.rb'


def guesser()
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

def breaker()
    player = Player.new()
    computer = Computer.new()
    game = MastermindGame.new()
    game.valid_code = computer.generate_code()
    while game.turns < MastermindGame.MAX_TURNS do
        puts "Turn #{game.turns+1}"
        game.print_result(game.check_guess(player.input_code()), "Player")
    end
end

def run_game()
    puts "Welcome to Mastermind."
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

        print "Press 1 to be the Guesser or Press 2 to be the Breaker: "
        response = gets.chomp
        until response.match?(/^1$|^2$/) do
            puts "Invalid input"
            print "Press 1 to be the Guesser or Press 2 to be the Breaker: "
            response = gets.chomp
        end 

        if response == '1'
            guesser()
        else
            breaker()
        end
    end
end

run_game()
    