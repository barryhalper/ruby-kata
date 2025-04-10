class Bowling

  def self.score(roll_sequence)
    total =0
    frames = roll_sequence.split(' ')
    frames.each_with_index do |val,i|
      if strike?(val)
        total += 10
        total += roll_total(frames[i+1]) if frames[i+1]
      elsif spare?(val)
        total += 10
        total += frames[i+1].split('').first.to_i if frames[i+1]
      else
        total += roll_total(frames[i])
      end
    end
    total
    end


  private

  def self.roll_total(frame)
    total = 0
    frame.split("").each do |i|
      total += i.to_i
    end
    total
  end

    def self.strike?(roll)
      roll == "X"
    end

    def self.spare?(roll)
      roll.include?("/")
    end

end

