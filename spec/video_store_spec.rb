require_relative '../video_store'




RSpec.describe 'VideoStore' do

  
  it 'should have a constant array of type' do
    expect(VideoStore::MOVIETYPES).to be_kind_of(Array)
    expect(VideoStore::MOVIETYPES.length).to eq(3)
    expect(VideoStore::MOVIETYPES[0]).to be_kind_of(String)
    expect(VideoStore::MOVIETYPES[0]).to eq('Regular')
  end

  it 'should have a constant float'do
    expect(VideoStore::EARLYRATE).to be_kind_of(Float)
    expect(VideoStore::EARLYRATE).to eq(2)
    expect(VideoStore::EARLYRATE).to eql(2.00)
  end
  
  describe VideoStore::Movie do
   
    before(:example) do
      @movie = VideoStore::Movie.new(VideoStore::MOVIETYPES[0], "Tenet", 1) 
    end

      subject { VideoStore::Movie.new("a", "b", 3) }
    
      it 'should take arguments from constructor' do
        expect(subject.type).to eq("a")
        expect(subject.title).to eq("b")
        expect(subject.number_days).to eq(3)
      end

      describe '#get_type' do
        subject {  @movie.get_type }
        it 'should return a hash of movie type' do 
          is_expected.to eq "Regular"
        end
      end

      describe '#price' do
        subject {  @movie.day_rate }
          it 'should return a float value' do
            is_expected.to be_kind_of(Float)
            is_expected.to eql 1.5
          end
        
      end

      
      describe '#get_type_index' do
        subject {  @movie.get_type_index }
          it 'should return an integer value' do
            is_expected.to eq 0
          end
        
      end


      describe '#price_per_day' do
        subject { VideoStore::Movie.new(VideoStore::MOVIETYPES[1], "Tenet", 3) }
        
        it 'should be 5.00 for a "New release" of 3 days' do
          expect(subject.price_per_day).to eql(5.00)
        end

        let(:regular_movie) { @movie}

        it 'should be 2.00 for a "Regular movie" of 1 day' do
           expect(regular_movie.price_per_day).to eql(2.00)
        end
       
        let(:regular_movie) {VideoStore::Movie.new(VideoStore::MOVIETYPES[0], "Blade Runner", 2)}
        it 'should be 2.00 for a "Regular movie" of 2 days' do
         expect(regular_movie.price_per_day).to eql(2.00)
        end
        
        let(:children_movie) {VideoStore::Movie.new(VideoStore::MOVIETYPES[2], "dumbo", 1)}
        
        it 'should be 1.50 for a "childrens movie" of 2 days' do
         expect(children_movie.price_per_day).to eql(1.50)
        end

      end

      describe '#renter_points' do 
        let(:jaws) {VideoStore::Movie.new(VideoStore::MOVIETYPES[0], "jaws", 2)}
        it 'should return 1 point regular movie for one day' do
            expect(jaws.renter_points).to eq(1)
        end

        let(:dune) {VideoStore::Movie.new(VideoStore::MOVIETYPES[1], "dune", 3)}
        it 'should return 2 points for regular movie for 3 days' do
            expect(dune.renter_points).to eq(2)
        end
       
      end

  end

  describe 'Rentals' do 
    subject{ VideoStore::Rentals.new("Barry Halper") }

    let(:arrival){ VideoStore::Movie.new(VideoStore::MOVIETYPES[0], "arrival", 1)}

    it 'should have a public attribute for the customer set to the init argument' do 
      expect(subject.customer).to eq("Barry Halper")
    end

    it 'should have an array of movies set to null' do 
      expect(subject.movies).to be_kind_of(Array)
      expect(subject.movies).not_to be_nil
    end

    describe '#add_movie' do 
      it 'should take an argument of type Movie and add to prublic property' do
        subject.add_movie(arrival)
        expect{subject.movies}.to change{subject.movies}.by([])
      end
    end

    describe '#get_price'  do 
      it 'should return a values of 4.0 for 2 movies' do 
        subject.add_movie(arrival)
        subject.add_movie(arrival)
        expect(subject.get_total).to eql(4.0)
      end
    end

    describe '#get_points'  do 
      it 'should return a values of 2 points for 2 movies' do 
        subject.add_movie(arrival)
        subject.add_movie(arrival)
        expect(subject.get_points).to eq(2)
      end
    end

  end
 
  describe 'VideoStore::statement' do
      before(:example) do
        rentals =  VideoStore::Rentals.new("Barry Halper")
        rentals.add_movie(VideoStore::Movie.new(VideoStore::MOVIETYPES[0], "Crazynotes", 1))
        rentals.add_movie(VideoStore::Movie.new(VideoStore::MOVIETYPES[0], "Teeth", 1))
        rentals.add_movie(VideoStore::Movie.new(VideoStore::MOVIETYPES[0], "The Web", 3))
        @output = VideoStore::statment(rentals)
      end


    it 'should return an array to be printed ' do
      expect(@output).to be_kind_of(Array)
      
    end
    
   it 'should be an array of 6 lines' do 
    expect(@output.length).to eq(6)
   end

   it 'should be the expected string "Rental Record for Barry Halper etc..." when converted to a string' do 
      expect(@output.join('\n')).to eq("Rental Record for Barry Halper\\n Crazynotes £2.0\\n Teeth £2.0\\n The Web £3.5\\nYou owe £7.5\\nYou earned 3 frequent renter points")
   end

   it 'should have the first film to have a value of £2.00' do 
      expect(@output[1].include?("£2.0")).to eq(true)
    end

    it 'should have the second film to have a value of £2.00' do 
      expect(@output[2].include?("£2.0")).to eq(true)
    end

    it 'should have the third film to have a value of £3.5' do 
      expect(@output[3].include?("£3.5")).to eq(true)
    end

    it 'should have a total of £7.5' do 
      expect(@output[4].include?("£7.5")).to eq(true)
    end

    it 'should have a 3 as renter points of 3' do 
      expect(@output[5].include?("3")).to eq(true)
    end
  end
  
   
end