# frozen_string_literal: true

require_relative '../mumble'

RSpec.describe 'Mock Mumble module' do
  subject { class_double(Mumble) }

  before do
    allow(subject).to receive(:mumble_letter).with("a").and_return("abc")
  end

  describe '#mumble_letter' do
    #it { is_expected.to respond_to(:mumble_letter).with(1).arguments}
    it 'should return a string' do
      expect(subject.mumble_letter("a")).to be_a(String)
    end
  end
end



RSpec.describe Mumble do
  
  it 'should be a valid module' do
    expect(subject).not_to be_nil
  end


  describe '#mumble_letter' do
    it { is_expected.to respond_to(:mumble_letter).with(1).arguments}
    it 'should return a string' do
      expect(subject.mumble_letter("a")).to be_a(String)
    end


    it 'should return an empty string if argument is empty' do
      expect(subject.mumble_letter("")).to be_empty
    end

    it 'should be an array' do
      expect(subject.mumble_letter("abC").split()).to be_kind_of(Array)
    end

    it 'should be an string with dahses' do
      expect(subject.mumble_letter("abc")).to eq("A-Bb-Ccc")
    end


    it 'aBCd should be "A-Bb-Ccc-Dddd"' do
      expect(subject.mumble_letter("abcd")).to eq("A-Bb-Ccc-Dddd")
    end

    it 'QWERTY should be "Q-Ww-Eee-Rrrr-Ttttt-Yyyyyy"' do
      expect(subject.mumble_letter("QWERTY")).to eq("Q-Ww-Eee-Rrrr-Ttttt-Yyyyyy")
    end
  end

end
