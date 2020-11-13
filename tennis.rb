 module Tennis
   
  SCORING = ['love',"fifteen","thirty","forty","advantage"]
 
  class Game
  attr_accessor :players, :player_turn

      def initialize()
        @players=[]
        @player_turn = 0
      end


      def add_player(player)
        @players << player
      end

      def add_point(player_number)
         @players[player_number].add_point()
        
      end

      def get_score
        @players.map {|item|item.points.last}
      end
      
      def is_deuce?
        @players[0].points.last == SCORING[3] && @players[1]=points.last = SCORING[3]
      end

      def is_advantage?
        @players[0].points.last == SCORING[4] && @players[1]=points.last = SCORING[4]
      end

      def serve
       return 0 if @players.length < 2
       select_player_to_serve
       winning_player =rand(2)
       @players[winning_player].add_point
       winning_player
      end

      def select_player_to_serve
       @player_turn == 0 ? 1 : 0 
      end

      def is_winner?
        player_1_points = @players[0].points.length
        player_2_points = @players[1].points.length
        difference = diff(player_1_points, player_1_points)

        player_1_points == 5 || player_1_points == 5 && (difference > 2)
        
      end


      def get_winner
         #get largest value of tow scores
        if  players[0].points.length > players[1].points.length
          players[0].name
        else
          players[1].name
        end 
      end

      def diff(a, b)
        (a - b).abs 
      end

 end

class Player 
    attr_accessor :name, :points

    def initialize(name)
      @name = name
      @points = [SCORING[0]]
      
    end

    def add_point()
      current_point = current_point_position + 1
      @points << (current_point < SCORING.length ?  SCORING[current_point] : SCORING.last)
    end

    def current_point_position
      SCORING.index(@points.last)
    end


end

end