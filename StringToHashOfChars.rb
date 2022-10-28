class StringToHashOfChars
    def initialize(text)
        validate_data(text)
        @text = text
        @txt_h = Hash.new
    end

    def execute
        str_h_with_count_chars
        @txt_h
    end

    private

    def str_h_with_count_chars
        @text.downcase.chars.map{|char| @txt_h.merge!({"#{char}" => @text.downcase.chars.count(char)})}
    end

    def validate_data(text)
        if not text.instance_of?(String) then raise "Oly string is permited." end
    end
end