class LCD 
  attr_accessor :numbers, :height, :width
  
    def initialize(height=0, width =0)
      @height = height
      @width = width
      @numbers = number_array
    end
 
    
    def convert(number)
      return "" if number == 0
      @numbers[number-1] 

    end


    private 
    
    def number_array
      dash_lenth = get_dash
      [ " \n|\n|", 
        "#{dash_lenth}\n#{dash_lenth}|\n|#{dash_lenth}", 
        "#{dash_lenth}\n#{dash_lenth}|\n#{dash_lenth}|", 
        " \n|#{dash_lenth}|\n  |", 
        "#{dash_lenth}\n|#{dash_lenth}\n#{dash_lenth}|", 
        "#{dash_lenth}\n|#{dash_lenth}\n|#{dash_lenth}|", 
        "#{dash_lenth}\n |\n |", 
        "#{dash_lenth}\n\|#{dash_lenth}|\n|#{dash_lenth}|", 
        "#{dash_lenth}\n\|#{dash_lenth}|\n #{dash_lenth}|"]
    end

  
    def get_dash
      dash = "_"
      return dash if @width <= 1
      (@width -1).times { dash += dash}
      dash 
    end


end