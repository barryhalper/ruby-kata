require_relative '../roman_numerals'

RSpec.describe RomanNumerals  do

  describe 'a class that manages this kata' do
  
    it 'has a property for large numbers' do
      expect(subject.large_numbers).not_to be_nil
      expect(subject.large_numbers.length).to eq(13)        
    end

  end

  describe '#convert' do
    it 'should exists' do
      expect(subject).to respond_to(:convert)
    end

    it 'should return a value for the number passed' do
      number = 1
      expect(subject.convert(number)).to eq('I')
    end

    it 'should check if number is less than one' do
      number = 0
      expect(subject.convert(number)).to eq('')
    end

    it 'should check if number is less than 11' do
      10.times do |value|
          puts subject.convert(value)
          expect(subject.convert(value)).not_to be_nil
      end
    end
    it 'should check if 12 is XII' do
            expect(subject.convert(12)).to eq('XII')
      end

      it 'should check if 37 is XXXVII' do
        expect(subject.convert(37)).to eq('XXXVII')
     end

     it 'should check if 59 is LIX' do
      expect(subject.convert(59)).to eq('LIX')
    end

    it 'should check if 401 is CDI' do
      expect(subject.convert(401)).to eq('CDI')
    end

    it 'should check if 996 is MCM' do
      expect(subject.convert(996)).to eq('CMXCVI')
    end
   
  end


end