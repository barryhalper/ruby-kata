require_relative '../bowling'

RSpec.describe Bowling do
  subject = Bowling
  describe '#score' do

    context "when playing 4 frames" do
      it "returns a score of 46 " do
        expect(subject.score("X 45 4/ 32")).to eq(46)
      end
    end

    context "when playing 2 frames" do
      it "returns a score of 28 " do
        expect(subject.score("X 45")).to eq(28)
      end
    end

    context "when playing 1 frame of a strike" do
      it "returns a score of 10 " do
        expect(subject.score("X")).to eq(10)
      end
    end

  end
end


