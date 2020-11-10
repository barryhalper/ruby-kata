require_relative '../lcd'


RSpec.describe LCD do
  describe 'a class that manages this kata' do
    it 'has a property for numbers' do
      expect(subject.numbers).not_to be_empty
      expect(subject.numbers.length).to eq(9)        
    end

    it 'should convert 1 to the right figure' do
      expect(subject.convert(1)).to eq(" \n|\n|")
    end
      
    it 'should convert 2 to the  "_\n_|\n|_"' do
      expect(subject.convert(2)).to eq("_\n_|\n|_")
    end

      it 'should add dashes based on number in width' do
        number = 5
        expect(subject.convert(number)).to eq("_\n|_\n_|")
      end
  

    describe 'check class takes constructor aruguments' do
        
        subject { LCD.new(1, 2)}
        
        it 'should take constructor arguments' do
          expect(subject.height).to eq(1)
          expect(subject.width).to eq(2)
        end


      it 'should check if number is less than one' do
          number = 0
          expect(subject.convert(number)).to eq('')
       end

       it 'should add dashes based on number in width(2)' do
          number = 5
          expect(subject.convert(number)).to eq("__\n|__\n__|")
        end
    end

    #       # it 'should add pipes based on number in height' do
    #       #   number = 2
    #       #   expect(subject.convert(number)).to eq("____\n|____\n____|")
    #       # end
    #     #end
  
      
    # end

    # describe 'class with a height and width of 2' do
    #   subject { LCD.new(2, 2)}

    #   it 'should check 1 with a height of 2' do
    #     result =  subject.convert(1)
    #     puts result
    #     expect(result).to eq(" \n|\n|\n|\n|")
    #   end


    #   it 'should check 2' do
    #     result =  subject.convert(2)
    #     puts result
    #     expect(result).to eq(" \n|\n| \n|\n|")
    #   end

    # end 
     

    # # describe 'class with 3 as height and 2 width' do
    # #   subject { LCD.new(3, 2)}

    # #   it 'should check 1 ' do
    # #     result =  subject.convert(1)
    # #     #puts result
    # #     expect(result).to eq(" \n|\n|\n| \n|\n|\n|")
    # #   end

    # # end 
      
    


  end

end
