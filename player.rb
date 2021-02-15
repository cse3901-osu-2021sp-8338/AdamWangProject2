# player.rb
# contain the class "Player"

class Player

    attr_accessor :score, :player_score

    # constructor
    def initialize(num)  
        @score = 0 # set the initial score to 0.

        # put the player information on the scoreboard.
        if num == 0
            @player_score = Text.new(
                @score,
                x: 200, 
                y: 20,
                size: 30,
                color: 'fuchsia' 
              )
        else 
            @player_score = Text.new(
                @score,
                x: 200, 
                y: 60,
                size: 30,
                color: 'olive' 
              )
        end       
    end

    # add score
    def add_score
        @score += 3
        @player_score.text = @score
    end

    # drop score
    def drop_score
        @score -= 1
        @player_score.text = @score
    end
end
