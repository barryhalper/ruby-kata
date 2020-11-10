require_relative '../bowling'

RSpec.describe Frame do
  describe 'the bowling class that manages this kata' do
  subject {Frame.new}
    

  it 'has a property for a number of pins' do
    expect(subject.pins).to eq(10)
  end

  

end
end