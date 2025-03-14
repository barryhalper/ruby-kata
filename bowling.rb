

class Bowling
  attr_accessor :frames, :number_frames, :pins_per_frame, :rolls_per_frame
    
    def initialize
      @frames  =  []
      @number_frames   = 10
      @pins_per_frame  = 10
      @rolls_per_frame = 2
    end

    def begin_frame
      @frames << frame
    end

    def frame
      {
         rolls: [],
         score: 0,
         pins_remianing: pins_per_frame,
         is_strike?: false
      }
    end


    def take_turn()
      pins_remianing = roll(rand(@pins_per_frame)) 
      # check if there are any spares
      if pins_remianing > 0
        # have another roll using a random nuber less than the number of pins remaining
        roll(rand(pins_remianing))
      end
      #check that final frame
      last_frame if is_last_frame? && @frames.last[:score] == 10
    end

    def get_strike
      strike_frame = frame
      strike_frame[:rolls] << 10
      strike_frame[:score] = @pins_per_frame
      strike_frame[:is_strike?] = true
      strike_frame[:pins_remianing] = 10
      @frames << strike_frame
      last_frame if is_last_frame? && @frames.last[:score] == 10
      #puts @frames.length
    end  


    def last_frame
      #rest the nimber of pins remianing
      pins_left = @pins_per_frame
      #if strike then two extra rolls
      number_extra_rolls.times{ |number| 
        # if first roll, use a random number under 10 othewise and random number < number o fpins remaing
        pins_left = number == 0 ? roll(rand(10)) : roll(pins_left)
      }
      
    end


    def number_extra_rolls
       #if strike then two extra rolls otherwise one
      @frames.last[:rolls].length ==1 ? 2 : 1
    end
    
    def roll(number)
      frame =  @frames.last
      # return message if frame has had two rolls and not the last roll (which maybe a strike) 
      return "you have had your goes for this frame" if frame[:rolls].length == @rolls_per_frame && !is_last_frame?
      # add rolls to array in frame
      frame[:rolls] << number
      set_frame_score(frame, number)
      set_pins_remianing(frame, number)
      frame[:is_strike?] = number==10 && frame[:rolls].length == 1 ? true : false
      frame[:pins_remianing] 
    end

    def set_pins_remianing(frame, number)
      pins = frame[:pins_remianing]
      frame[:pins_remianing] = number > pins ? 0 : pins-number
    end


    def set_frame_score(frame, number)
      score = frame[:score]
      frame[:score]  = score + number
    end

    def number_frames_remaing
      @number_frames - @frames.length
    end

    def current_score
      score = 0
      @frames.each {|item|
        score += item[:score]
      }
      score
    end

    def total_score
      score = 0
      @frames.each {|item|
        is_last = is_this_last_frame?(item)
        if is_spare?(item)
          # spare gives the total per frame + the next roll
          score += (is_last) ? item[:score] : (next_frame(item)[:rolls][0]+10)
        elsif item[:is_strike?]
           # spare gives the total per frame + the next 2 rolls (or total frame score)
          score += (is_last) ? item[:score] : (next_frame(item)[:score]+10)
        else
          score += item[:score] 
        end
      }
      score
    end

    def is_this_last_frame?(item)
      item == @frames.last ? true : false
    end

    def is_last_frame?
       @frames.length == (@number_frames)
    end
    
    def is_spare?(item)
      return true if (item[:score]==10 && !item[:is_strike?]) 
      false
    end

    def next_frame(item)
      @frames[@frames.find_index(item)+1]
    end

  
    




end

