require_relative '../bowling_game'

RSpec.describe BowlingGame do
  let(:game) { BowlingGame.new }

  context 'when rolls are all in the gutter' do
    before do
      n =20
      num_pins = 0
      (1..n).each do |i|
        game.roll(num_pins)
      end
    end

  it "score will be zero" do
    expect(game.score).to eq 0
  end
  end

  context 'when all throws are 1' do
    let(:game) { BowlingGame.new }
    before do
      (1..20).each do |i|
        game.roll(1)
      end
    end

    it "score will be 20" do
      expect(game.score).to eq 20
    end
  end

  # context 'when rolling many throws' do
  #   let(:game) { BowlingGame.new }
  #   before do
  #     n =20
  #     num_pins = 0
  #     (1..n).each do |i|
  #       game.roll(num_pins)
  #     end
  #   end
  # end

  context 'when a spare is thrown' do
    let(:game) { BowlingGame.new }

    before{
      game.roll(5)
      game.roll(5)
      game.roll(3)
      roll_many(game, 17, 0)
    }
    it "returns a score of 16" do
      expect(game.score).to eq 16
    end
  end

  context 'when a testing on a spare' do
    let(:game) { BowlingGame.new }

    before do
      game.roll(5)
      game.roll(5)
      game.roll(3)
      roll_many(game, 17, 0)
    end

    it "the score will be 16" do
      expect(game.score).to eq 16
    end

  end

  context 'when a testing on a strike' do
    let(:game) { BowlingGame.new }

    before do
      game.roll(10)
      game.roll(3)
      game.roll(4)
      roll_many(game, 16, 0)
    end

    it "the score will be 24" do
      expect(game.score).to eq 24
    end

  end

  context 'when a testing on a perfect game' do
    let(:game) { BowlingGame.new }
    before do

      roll_many(game, 16, 10)
    end

    it "the score will be 300" do
      expect(game.score).to eq 300
    end
  end

end

def roll_many(game, n, num_pins)
  (1..n).each do |i|
    game.roll(num_pins)
  end
end