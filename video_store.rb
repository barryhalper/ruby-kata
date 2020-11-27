module VideoStore
  
  PRICE      = 1.50
  EARLYRATE  = 2.00
  

  class Movie
    attr_reader :type, :title, :number_days
    
      def initialize(args={})
        args = defaults.merge(args)
        #@type = args[:type]
        @title =  args[:title]
        @number_days = args[:number_days]
        @max_days = args[:max_days]
      end

      def defaults
        {:number_days => 1, :max_days => 3}
      end

      def price_per_day
         days_before_cutoff = (@max_days-1)
         days_of_full_rate = @number_days - days_before_cutoff
       
          number_days < @max_days ? VideoStore::EARLYRATE : (days_of_full_rate * day_rate)  + VideoStore::EARLYRATE 
         
      end

      def renter_points
         1 
      end
     

  
      def day_rate 
        VideoStore::PRICE
      end

    
  
    end

  class RegularMovie < Movie
   
  end

  class NewMovie < Movie
    def renter_points
      number_days >= 2 ? 2 : 1   
    end


    def day_rate 
      VideoStore::PRICE * 2
    end
  end

  class ChildrensMovie < Movie
    def price_per_day
      number_days <= @max_days ? day_rate : day_rate * (number_days - @max_days) + VideoStore::PRICE
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