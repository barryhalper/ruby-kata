require_relative '../wrapper'

# frozen_string_literal: true

RSpec.describe 'Wrapper' do
  

  #it {is_expected.not_to be_instance_of(Wrapper)}
  
  describe '#wrap' do 

      it 'should receive text and return array of words' do
        string = "12345 abcd 1234"
        result = Wrapper.wrap(string, 10)
        expect(result).not_to be_empty
        
        expect(result).to eq("12345 abcd\n1234\n")
       
      
      end
 

  end

end
