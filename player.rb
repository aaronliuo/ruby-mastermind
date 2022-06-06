class Player
    
    def initialize()

    end

    def check_input(input)
        if !input.match?(/^[1-6]{4}$/)
            return false
        end
        return true
    end

    def input_code()
        puts "Type in a four digit code with numbers within 1-6 inclusive."
        code = gets.chomp
        until check_input(code) do
            puts "Invalid code!"
            puts "Type in a four digit code with numbers within 1-6 inclusive."
            code = gets.chomp
        end
        code
    end

end
