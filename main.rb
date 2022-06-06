require_relative ./game.rb


def guesser()


end

def breaker()


end

def run_game()
    puts "Welcome to Mastermind."
    print "Press 1 to be the Guesser or Press 2 to be the Breaker: "
    response = gets.chomp
    until response.match?(/1|2/) do
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
    