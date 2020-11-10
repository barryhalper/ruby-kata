require_relative '../bowling'

RSpec.describe Bowling do
  subject = Bowling.new
  describe 'the bowling class that manages this kata' do
   
  it 'has a property for the current frames' do
    expect(subject.frames).to be_empty
  end

  it 'has a property for a number of frames' do
    expect(subject.number_frames).to eq(10)
  end
   
  #   it 'should check no more than two rolls per frame' do
  #     subject.begin_frame
  #     #expect(subject.roll(rand(10)).to_not eq(11))
  # end

  end

  describe "#begin_frame"  do
    game = Bowling.new
    it 'add a frame to the game and check number of games is 9' do
     # puts object
      game.begin_frame
      expect(game.number_frames_remaing).to eq(9)
    
    end
    it 'add another frames to the same game and check number of games is no longer the same' do
      #puts object
      expect{game.begin_frame}.to change{game.number_frames_remaing}.by(-1)
    end
    
   describe '#roll' do
      new_game = Bowling.new
      new_game.begin_frame
      #puts new_game.frames.length
      
      it 'should return a score of 1' do
        expect(new_game.roll(9)).to eq(1)
      end

      it 'another roll of 1 should return 0' do
        expect(new_game.roll(1)).to eq(0)
        #expect(new_game.total_score).to eq(10)
      end

      it 'another roll should return throw a roll error' do
        expect(new_game.roll(1)).to eq("you have had your goes for this frame")
      end

      it 'should have a new frame with new scores' do
        expect{new_game.begin_frame}.to change{new_game.number_frames_remaing}.by(-1)
        new_game.roll(5)
        new_game.roll(4)
        expect(new_game.current_score).to eq(19)
      end

      it 'should record strike' do
        
        expect{new_game.begin_frame}.to change{new_game.number_frames_remaing}.by(-1)
        new_game.roll(10)
        #puts new_game.inspect
        #new_game.roll(4)
        expect(new_game.current_score).to eq(29)
      end


      it 'should add frame value of 5 to new frame total' do
        new_game.begin_frame
        #expect{new_game.begin_frame}.to change{new_game.number_frames_remaing}.by(-1)
        new_game.roll(2)
        new_game.roll(3)
        #new_game.roll(4)
        expect(new_game.current_score).to eq(34)
      end

      it 'should add frame value of 9 to new frame total' do
        new_game.begin_frame
        #expect{new_game.begin_frame}.to change{new_game.number_frames_remaing}.by(-1)
        new_game.roll(7)
        new_game.roll(2)
        #new_game.roll(4)
        expect(new_game.current_score).to eq(43)
      end
      #puts new_game.inspect
      it 'should be a total of 53 after 4 frames' do
        expect(new_game.total_score).to eq(53)
          
      end
   end

   describe '#take_turn' do
    full_game = Bowling.new
    it 'should play a full game and check object persistance' do 

      10.times{
        full_game.begin_frame
        full_game.take_turn
        expect(full_game).to equal(full_game)
        
      }
    end
    puts full_game.total_score
      it 'should have played 10 frames' do
        expect(full_game.frames.length == 10)
      end

      it 'should have a total score' do
        expect(full_game.total_score).not_to be_nil
      end

      it 'should check for strikes' do
        full_game.frames.each { |item|
           if item[:is_strike?]
            expect(item[:rolls].length).to eq(1)
          else
            expect(item[:rolls].length).to eq(2)
           end
        }
        
      end
    

   end

   describe 'full game with a strike on the last frame' do
    full_game = Bowling.new
    9.times{
      full_game.begin_frame
      full_game.take_turn
    }

    it 'should have 9 frames' do
      expect(full_game.frames.length).to eq(9)
    end

    describe "#get_strike" do
     
      it 'should be a strike' do
        strike = full_game.get_strike
        expect(full_game.frames.length).to eq(10)
       
      end
    
    end

    describe "last frame" do 
      it 'should have a score greater than 10' do
        puts full_game.frames.last.inspect
        expect(full_game.frames.last[:score]).to be >= 10
       
        #expect(full_game.frames.last[:rolls].length).to be > 1
      end
    end



  end


  describe 'full game with a spare on the last frame' do
    full_game = Bowling.new
    9.times{
      full_game.begin_frame
      full_game.take_turn
    }
    full_game.begin_frame
    full_game.roll(6)
    full_game.roll(4)

    it 'should have 10 frames' do
      expect(full_game.frames.length).to eq(10)
    end

     
    describe "last frame with a spare" do 
      it 'should have a score greater than 10' do
        #puts full_game.frames.last.inspect
        expect(full_game.frames.last[:score]).to be >= 10
        expect(full_game.frames.last[:rolls].length).to be <= 2 
        #expect(full_game.frames.last[:rolls].length).to be > 1
      end
    end



  end

  end

end


