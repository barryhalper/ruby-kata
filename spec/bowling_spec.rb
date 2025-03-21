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
 
  end

  describe "#begin_frame"  do
    subject {Bowling.new}
    it 'adds a frame to the game and check number of games is 9' do
      subject.begin_frame
      expect(subject.number_frames_left).to eq(9)
    end

    it 'adds another frames to the same game and check number of games is no longer the same' do
      expect{subject.begin_frame}.to change{subject.number_frames_left}.by(-1)
    end
    
   describe '#roll' do
      new_game =  Bowling.new
       new_game.begin_frame

      it 'returns a score of 1' do
        expect(new_game.roll(9)).to eq(1)
      end

      it 'another roll of 1 should return 0' do
        expect(new_game.roll(1)).to eq(0)
      end

      it 'another roll should return throw a roll error' do
        expect(new_game.roll(1)).to eq("you have had your goes for this frame")
      end

      it 'will have a new frame with new scores' do
        expect{new_game.begin_frame}.to change{new_game.number_frames_left}.by(-1)
        new_game.roll(5)
        new_game.roll(4)
        expect(new_game.current_score).to eq(19)
      end

      it 'will record strike' do
        expect{new_game.begin_frame}.to change{new_game.number_frames_left}.by(-1)
        new_game.roll(10)

        expect(new_game.current_score).to eq(29)
      end


      it 'adds a  frame value of 5 to new frame total' do
        new_game.begin_frame
        new_game.roll(2)
        new_game.roll(3)
        expect(new_game.current_score).to eq(34)
      end

      it 'adds  frame value of 9 to new frame total' do
        new_game.begin_frame
        new_game.roll(7)
        new_game.roll(2)
      
        expect(new_game.current_score).to eq(43)
      end
    
      it 'has a total of 53 after 4 frames' do
        expect(new_game.total_score).to eq(53)
          
      end
   end

   describe '#take_turn' do
    full_game = Bowling.new
    it 'should play a full game and check object persistence' do

      10.times{
        full_game.begin_frame
        full_game.take_turn
        expect(full_game).to equal(full_game)
        
      }
      end

     it 'will have played 10 frames' do
        expect(full_game.frames.length == 10)
      end

      it 'has a total score' do
        expect(full_game.total_score).not_to be_nil
      end

   end

describe 'full game with a strike on the last frame' do
    full_game = Bowling.new
    9.times{
      full_game.begin_frame
      full_game.take_turn
    }

    it 'will have 9 frames' do
      expect(full_game.frames.length).to eq(9)
    end

    describe "#get_strike" do
     
      it 'will be a strike' do
        full_game.get_strike
        expect(full_game.frames.length).to eq(10)
      end
    
    end

    describe "last frame" do 
      it 'will have a score greater than 10' do
        puts full_game.frames.last.inspect
        expect(full_game.frames.last[:score]).to be >= 10
       
        
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

    it 'will have 10 frames' do
      expect(full_game.frames.length).to eq(10)
    end

     
    describe "last frame with a spare" do 
      it 'will have a score greater than 10' do
       
        expect(full_game.frames.last[:score]).to be >= 10
        expect(full_game.frames.last[:rolls].length).to be <= 2 
    
      end
    end

   

  end

  end

end


