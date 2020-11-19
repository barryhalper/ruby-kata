module VideoStore
  
  MOVIETYPES = ['Regular', 'New Release',  'Childrens']
  PRICE      = 1.50
  EARLYRATE  = 2.00
  

  class Movie
    attr_reader :type, :title, :number_days
    
      def initialize(type, title, number_days)
        @type = type
        @title = title
        @number_days = number_days
        @max_days = 3
      end

      def price_per_day
         days_before_cutoff = (@max_days-1)
         days_of_full_rate = number_days - days_before_cutoff
         if is_children?
          number_days <= @max_days ? day_rate : day_rate * (number_days - @max_days) + VideoStore::PRICE
         else
          number_days < @max_days ? VideoStore::EARLYRATE : VideoStore::EARLYRATE + (days_of_full_rate * day_rate) 
         end
      end

      def renter_points
        return 1 unless extra_points? 
        number_days >= 2 ? 2 : 1
           
      end
      def is_children?
        get_type == MOVIETYPES.last
      end

      def extra_points?
        get_type == MOVIETYPES[1]
      end

      def day_rate 
         get_type_index == 1 ? VideoStore::PRICE * 2 : VideoStore::PRICE
      end

      def get_type
       VideoStore::MOVIETYPES.find {|i| i == @type}
      end

   

      def get_type_index
        VideoStore::MOVIETYPES.index {|i| i == @type}
      end
  
  end

  
  class Rentals
    attr_accessor :movies, :customer

       def initialize(name)
        @customer = name
        @movies   = []
       end
    
       def add_movie(movie)
        @movies << movie
      end

      def get_total
        total = 0
        movies.each{|m| total += m.price_per_day }
        total
      end

      def get_points
        points = 0
        movies.each{|m| points += m.renter_points }
        points
      end

  end

  def self.statment(rentals)
   currency = "£" 
   array = []
   array <<  "Rental Record for #{rentals.customer}"
   rentals.movies.each {|movie| 
    array << " #{movie.title} #{currency}#{movie.price_per_day}"
    }
    array <<  "You owe #{currency}#{rentals.get_total}"
    array <<  "You earned #{rentals.get_points} frequent renter points"
    array
  end
end