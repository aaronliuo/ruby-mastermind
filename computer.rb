class Computer

    def initialize()

    end


    def generate_code()
        code = ""
        4.times do
            code += rand(1..6).to_s
        end
        code
    end
end