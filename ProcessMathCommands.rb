class ProcessMathCommands
    def initialize(command)
        @operator = map_data(command, " ", 0)
        @val_first = map_data(map_data(command, " ", 1), ",", 0).to_f
        @val_last = map_data(command, " ", 2).to_f
    end

    def execute
        calculate
    end

    private

    def map_data(cmd, separator, index)
        cmd.split(separator)[index]
    end

    def calculate
        case @operator
        when "ADD"
            return "%.2f" % sum
        when "SUB"
            return "%.2f" % subtract
        when "MUL"
            return "%.2f" % multiply
        when "DIV"
            return "%.2f" % division
        else
            raise "Operation not found!"
        end
    end

    def sum
        @val_first + @val_last
    end

    def subtract
        @val_first - @val_last
    end

    def multiply
        @val_first * @val_last
    end

    def division
        if @val_last == 0
            raise "Indetermined division by zero!"
        else
            @val_first / @val_last
        end
    end
end

print ProcessMathCommands.new("DIV 234, -34.56").execute