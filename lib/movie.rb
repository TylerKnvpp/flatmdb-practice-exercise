class Movie

    attr_reader :title, :year, :box_office
    @@all = []
   

    def initialize(attr)
        @title = attr[:title]
        @year = attr[:year]
        @box_office = attr[:box_office]
        @@all << self
        
    end

    def self.all
        @@all
    end

    def title
        @title
    end

    def year
        @year
    end

    def box_office
        @box_office
    end

    def self.blockbusters
        Movie.all.find_all{|i| i.box_office > 50_000_000}

    end

    def self.box_office_total_by_year(year)
        Movie.all.find_all{|film| film.year == year}.map {|movie| movie.box_office}.sum 
    end

    def same_decade
        Movie.all.select do |movie|
            movie.year.between?(self.year - 5, self.year + 5)
        end
    end

    def cast_role(actor_inst, char_name, earnings)
        Role.new(actor: actor_inst, movie: self, name: char_name, earnings: earnings)
    end

    def stars_by_rank
         Role.all.select{|movies| movies.movie == self}.map{|info| info.actor}.sort_by{|i| i.rank}
    end

end




# - `Movie#cast_role`
#   - given an **actor instance**, character_name, and earnings, create a new role for them in this film
# - `Movie#stars_by_rank`
#   - return a list of actors in this movie sorted by their rank