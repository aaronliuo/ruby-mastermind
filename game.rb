class MastermindGame

    attr_reader :has_code

    def initialize()
        @has_code = false
        @valid_code = ""
    end

    def check_input(input)
        if !input.match?(/[0-9]{4}/)
            return false
        end
        return true
    end

    def enter_code(code)
        if !check_input(code) return end
        @valid_code = code
        @has_code = true
    end

    def check_guess(guess)
        guess_used = Array.new(4, 0)
        code_used = Array.new(4, 0)
        result = ""
        for i in 0...4
            if guess[i] == @valid_code[i]
                result += '1'
                guess_used[i] == 1
                code_used[i] == 1
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
                    code_used[j] == 1
                end
            end
        end
        return result
    end

    
end