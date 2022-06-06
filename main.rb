require_relative './game.rb'
require_relative './player.rb'
require_relative './computer.rb'


def guesser()


end

def breaker()
    player = Player.new()
    computer = Computer.new()
    game = MastermindGame.new()
    game.valid_code = computer.generate_code()
    while game.turns < MastermindGame.MAX_TURNS do
        player_guess = player.input_code()
        game.print_result(game.check_guess(player_guess), "Player")
    end
end

def run_game()
    puts "Welcome to Mastermind."
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

run_game()
    