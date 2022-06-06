class Computer

    attr_reader :comp_guess
    @@numbers = ['1', '2', '3', '4', '5', '6']

    def initialize()
        @possible_codes = @@numbers.repeated_permutation(4).to_a
        @possible_codes.each_with_index do |code, idx|
            @possible_codes[idx] = code.join
        end
        @comp_guess = "1122"
    end

    def calculate_possibility(code)
        guess_used = Array.new(4, 0)
        code_used = Array.new(4, 0)
        result = ""
        for i in 0...4
            if @comp_guess[i] == code[i]
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
                if code_used[j] == 0 && @comp_guess[i] == code[j]
                    result += '0'
                    guess_used[i] = 1
                    code_used[j] = 1
                    break
                end
            end
        end
        return result
    end

    def filter_possibilities(result)
        @possible_codes = @possible_codes.select { |code| calculate_possibility(code) == result}
        @comp_guess = @possible_codes[0]
    end

    def generate_code()
        code = ""
        4.times do
            code += rand(1..6).to_s
        end
        code
    end
end