class Role

    attr_reader :actor, :movie, :name
    attr_accessor :earnings

    @@all = []

    def initialize(attr)
        @actor = attr[:actor]
        @movie = attr[:movie]
        @name = attr[:name]
        @earnings = attr[:earnings]
        @@all << self
    end

    def self.all
        @@all
    end

    # r1 = Role.new(actor: a1, movie: m1, name: "Svetlana", earnings: 0.15)

    def self.all
        @@all
    end

end


# # - `Role#actor`
# #   - returns the actor object for that given role
# #   - Once a role is created, I should not be able to change the actor
# # - `Role#movie`
# #   - returns the movie object for that given role
# #   - Once a role is created, I should not be able to change the movie
# # - `Role#name`
# #   - returns a **string** that is the character's name
# # - `Role#earnings`
# #   - returns a **number** representing the percentage of the movie's box office earnings that the actor gets paid
# #   - This should be a float that is not a negative number.
# # - `Role.all`
# #   - returns all of the roles


