class MastermindGame

    attr_writer :valid_code
    attr_reader :turns
    @@MAX_TURNS = 12

    def initialize()
        @valid_code = ""
        @turns = 0
    end

    def self.MAX_TURNS()
        @@MAX_TURNS
    end

    def check_guess(guess)
        puts @valid_code
        guess_used = Array.new(4, 0)
        code_used = Array.new(4, 0)
        result = ""
        for i in 0...4
            if guess[i] == @valid_code[i]
                result += '1'
                guess_used[i] = 1
                code_used[i] = 1
            end
        end
        for i in 0...4
            if guess_used[i] == 1
                next
            end
            for j in 0...4
                if code_used[j] == 0 && guess[i] == @valid_code[j]
                    result += '0'
                    guess_used[i] = 1
                    code_used[j] = 1
                    break
                end
            end
        end
        @turns += 1
        return result
    end

    def print_result(result, guesser)
        if result.match?(/1{4}/)
            puts "#{guesser} has cracked the Code!"
            @turns = @@MAX_TURNS
        elsif @turns >= @@MAX_TURNS
            puts "#{guesser} has failed to crack the Code..."
        else
            puts result
        end
    end
end