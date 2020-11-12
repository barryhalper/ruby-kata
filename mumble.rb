module Mumble

  def self.mumble_letter(string)
    return "" if string.empty?
    find_letter_position(string.downcase)
  end

  private 

  def self.find_letter_position(string)
    return_array = []
    string.split("").each.with_index  {|value, index|  
        return_array  << add_items_for_letter(index + 1, value)
    }
    return_array.join("-")
  end 


  def self.add_items_for_letter(number_items, letter)
    #puts number_items
    letters = []
    return letter.upcase if number_items ==1
    (number_items).times{
      letters << letter.downcase
    }
 
    letters.join("").capitalize()
  end
end