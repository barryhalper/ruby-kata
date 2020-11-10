require_relative '../person'

RSpec.describe 'Person' do

  let(:barry) { instance_double(Person, name:'Barry') }

  it 'should describe my person class' do
    expect(barry.name).to eq('Barry')
  end


end
