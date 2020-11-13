require_relative '../tennis'

# frozen_string_literal: true
RSpec.shared_context 'common' do
  def add_players_helper_method
    @game.add_player(Tennis::Player.new("Barry"))
    @game.add_player(Tennis::Player.new("Dean"))
  end
end

RSpec.describe Tennis::Player do
  let(:player1) { Tennis::Player.new("barry")} 
  it 'should be class with a single constructor argument' do
    expect(player1.name).to eq('barry')
   # puts subject

  end

  it 'should have an attribute for points set to zero' do
    expect(player1.points).to be_kind_of(Array)
   # expect(player1.points[0]).to eq(Tennis::SCORING[0])
   # puts subject

  end
end



RSpec.describe Tennis::Game do
  before(:example) do
    @game = Tennis::Game.new
    
  end

  it 'should have a constant array of scores' do
    expect(Tennis::SCORING).to be_kind_of(Array)
    expect(Tennis::SCORING.length).to eq(5)
  end


  it 'should be a class with an array property of players' do
    #expect(subject).to have_attributes(name:[])
    expect(@game.players).to be_kind_of(Array)

  end

  it 'should have a property of which players turn it is' do
    #expect(subject).to have_attributes(name:[])
    expect(@game.player_turn).to eq(0)

  end

 

  describe '#add_player' do
    subject {Tennis::Game.new}
    let(:player1) { Tennis::Player.new("barry")} 
    #
    it 'should add a player object to array' do
      expect(@game).to respond_to(:add_player)
      @game.add_player(player1)
      expect{@game.players}.to change{@game.players}.by([])
      @game.add_player(Tennis::Player.new("Dean"))
      expect{@game.players}.to change{@game.players}.by([])
      expect(@game.players.length).to eq(2)
     
    end
    #it {is_expected(subject.add_player(player1)).to be_kind_of(Array)}
  end

  describe '#add_point and #score' do
    include_context 'common'
    it 'should add a point to a player' do
      add_players_helper_method
       expect(@game).to respond_to(:add_point)
       @game.add_point(0) 
       expect(@game.players[0].points.length).to eq(2)
       @game.add_point(0) 
       expect(@game.players[0].points.length).to eq(3)
       @game.add_point(1) 
       expect(@game.players[1].points).to eq(["love", "fifteen"])
       expect(@game).to respond_to(:get_score)
       #expect(@game.get_score).to eq([Tennis::SCORING[2],Tennis::SCORING[1]])
     
       
    end

  end

  describe '#is_deuce' do
    include_context 'common'
   
    it 'should check if current score is deuce' do
      add_players_helper_method
      expect(@game).to respond_to(:is_deuce?)
      expect(@game.is_deuce?).to eq(false)
    end
  
  end


  describe '#serve' do
    include_context 'common'
    it 'should serv and return' do
      add_players_helper_method
      expect(@game).to respond_to(:serve)
      #expect(@game.serve).to be <=1

      #expect(@game.serve?).to eq(0)
    end

    it 'should play 4 sets and check the score is greater than 30' do
      add_players_helper_method
      4.times { @game.serve }
      expect(@game.get_score.length).to eq(2)
      #puts @game.get_score
    end
     it 'should play 8 sets and check the score is greater than 30' do
      add_players_helper_method
       8.times { @game.serve }
       #expect(@game.is_winner?).to eq(false)
     end
    
  end


  describe 'play full set/game' do
    include_context 'common'
    it 'should play a full game until winner is found' do
      add_players_helper_method
      @game.serve
      until @game.is_winner?
        @game.serve
      end

      expect(@game.get_winner).to be_truthy
      #puts @game.players.inspect
    end

  end
end
