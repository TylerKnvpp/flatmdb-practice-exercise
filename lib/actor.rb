class Actor

    attr_reader :name
    attr_accessor :rank, :age

    @@all = []
    @@actor_count = 0
    @@age_total = 0

    def initialize(attr)
        @name = attr[:name]
        @rank = attr[:rank]
        @age = attr[:age]
        @@age_total += @age
        @@actor_count += 1
        @@all << self
    end

    def self.all
        @@all
    end

    def name
        @name
    end

    def self.actor_count
        @@actor_count
    end

    def age
        @age
    end

    def self.age_total
        @@age_total
    end

    def self.average_age
        avg_age = @@age_total / @@actor_count
        avg_age.to_f
    end

    def self.a_list
        a_array = @@all
        a_array.find_all {|i| i.rank == "A"}
    end

    def rank
        @rank
    end

    def sign_contract(movie, name, earnings)
        Role.new(self, movie, name, earnings)
    end

    def total_roles
        Role.all.select {|role| role.actor == self}.count
    end

    def movies    
        Role.all.select{|movies| movies.actor == self}.map{|role| role.movie.title}
    end

    def blockbusters
        Role.all.select{|movies| movies.actor == self && movies.blockbusters}
    end

    def total_earnings
        earnings =  Role.all.select{|movies| movies.actor == self}.map{|role| role.earnings}
        movie_earnings = Role.all.select{|movies| movies.actor == self}.map{|rle| rle.movie.box_office}
        cheddar = earnings.zip(movie_earnings).map{|x, y| x * y}
        cheddar = cheddar.reduce(:+)
    end

    def self.most_successful
        self.all.max_by do |actor_instance|
            actor_instance.total_earnings
        end

    end

    
    
end