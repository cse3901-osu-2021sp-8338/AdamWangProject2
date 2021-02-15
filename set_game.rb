# set_game.rb. The main Program of this game

# Required gems and files
require 'ruby2d'
require_relative 'supports'
require_relative 'table'
require_relative 'card'
require_relative 'player'

# set up the table and play bgm
set_table
bgm = Music.new('Sounds/bgm.mp3')
bgm.loop = true
bgm.play 


# crearte a new game
game = Table.new  
game.show_deck_number

# capture the mouse click
# if the game is not end, capture the location of the mouse click
# if the game is end, show the game over page.
on :mouse_down do |event|
    if game.end_game == false
        if game.player_playing == -1
            game.player_push_button(event)
            game.player_push_shuffle(event)
        else
            if game.card_selected.length < 3
                game.select_cards(event)
                if game.card_selected.length == 3
                    game.check_if_true?
                    game.reset_table
                end
                    
            end
        end
    end

    if game.end_game == true
        game_over
    end
        
end

# The show function in gem ruby2d
show