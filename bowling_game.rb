class BowlingGame

  def initialize
    @score = 0
    @rolls = Array.new(21, 0)
    @current_roll = 0
  end

  def roll(pins)
    @rolls[@current_roll] = pins
    @current_roll += 1
  end

  def score
    frame_index = 0
    (0...10).each do |frame|
      if strike?(frame_index)
        @score += 10 + strike_bonus(frame_index)
        frame_index += 1
      elsif spare?(frame_index)
        @score += 10 + @rolls[frame_index + 2]
        frame_index += 2
      else
        @score += sum_balls_in_frame(frame_index)
        frame_index += 2
      end
    end
    @score
  end

  private
  def strike_bonus(frame_index)
    @rolls[frame_index + 1] + @rolls[frame_index + 2]
  end

  def sum_balls_in_frame(frame_index)
    @rolls[frame_index] + @rolls[frame_index + 1]
  end

  def strike?(frame_index)
    @rolls[frame_index] == 10
  end

  def spare?(frame_number )
    @rolls[frame_number]  + @rolls[frame_number+ 1] == 10
  end

  end

