class Wrapper

  def self.wrap(text, number)
    return text if !text =~ /\s/ || text.length < number
     #I found this solution online as I thought it might need regex which i am not fan of
     text.gsub(/(.{1,#{number}})(\s+|\Z)/, "\\1\n")
  end


  


end