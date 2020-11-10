class RomanNumerals
  attr_reader :large_numbers
    def initialize
      
      @large_numbers = roman_mapping
    end
    
    def convert(number)
      return '' if number ==0
      roman = ""
      roman_mapping.each do |key,value|
        until number < key
          roman << value
          number -= key
        end
      end
      roman
    end

    def roman_mapping
      {
        1000 => "M",
        900 => "CM",
        500 => "D",
        400 => "CD",
        100 => "C",
        90 => "XC",
        50 => "L",
        40 => "XL",
        10 => "X",
        9 => "IX",
        5 => "V",
        4 => "IV",
        1 => "I"
      }
    end
end