# table.rb
# Contains the calss "Table"

require_relative 'card'
require_relative 'player'
require_relative 'supports'

class Table
    attr_accessor :deck, :card_on_table, :players, :player_playing, :card_selected, :end_game

   # Constructor 
   def initialize
    @deck = (0..80).to_a.shuffle # The id of current deck (from 0 to 80)
    @card_id_on_table = @deck[0,12] # The id of the cards on table
    @deck = @deck[12,80] # Update the current deck, cause 12 of them move to table
    @card_on_table = Array.new # The array contain the actual card on table, not the id, see class "Card"
    @players = [Player.new(0), Player.new(1)] # Array of players
    @player_playing = -1 # Indicate which player is current selecting card. If none, the value is -1
    @card_selected = Array.new # The array of card is currently select, will be displayed on the bottom of the table.
    @set_result = true # Show whether the selected  three cards are set.
    @end_game = false # Show whether the game is currently end

    # For each card on table, create a card object and put it in the array, then draw the card on the table.
    @card_id_on_table.each_index { |i| @card_on_table[i] = Card.new(@card_id_on_table[i], i) }
    @card_id_on_table.each_index { |i| @card_on_table[i].draw_top }
   end

   # show the number of card left in the deck on the top of the screen
   def show_deck_number
    @deck_number = Text.new(
        "Deck:  " + @deck.length.to_s,
        x: 595, y: 22,
        size: 40,
        color: 'blue'
      )
   end

   # if the player click shuffle, this function will shuffle all the cards and put 12 new cards on the table. 
   # Usually happens when both player stuck and can't come out with a set.
   def player_push_shuffle(event)
    if (event.x > 580 && event.x < 780 && event.y > 640 && event.y < 690) 
        @card_id_on_table.each_index { |i| @card_on_table[i].remove_top }
        @deck.concat(@card_id_on_table).shuffle
        @card_id_on_table = @deck[0,12]
        @deck = @deck[12,@deck.length-1]
        @card_id_on_table.each_index { |i| @card_on_table[i] = Card.new(@card_id_on_table[i], i) }
        @card_id_on_table.each_index { |i| @card_on_table[i].draw_top }
    end
   end

   # Determine which player will be selecting cards.
   # Before either player selecting card, they must click the buttom with their player number on the screen.
   def player_push_button(event)
    if ((event.x - 180)**2 + (event.y - 810)**2).abs <= 8100
        @player_playing = 0
    elsif ((event.x - 1180)**2 + (event.y - 810)**2).abs <= 8100
        @player_playing = 1
     
    else
        @player_playing = -1
    end
   end

   # After the player number buttom is clicked, they are going to selected 3 cards. This function will track
   # The selected card up to 3 and will eleminate duplicate seceltion.
   def select_cards(event)
    for i in 0..11 do
        if event.x>=CARD_POSITION_X[i] && event.x<=CARD_POSITION_X[i]+CARD_WIDTH && event.y>=CARD_POSITION_Y[i] && event.y<=CARD_POSITION_Y[i]+CARD_HEIGHT
          @card_selected[@card_selected.length] = @card_on_table[i] 
          if @card_selected == @card_selected.uniq 
            @card_selected[@card_selected.length-1].draw_bottom(@card_selected.length-1)
          end
          @card_selected = @card_selected.uniq
        end   
    end
   end

   # After 3 card is selected, this function will check whether it is a set and will change the instance variable @Set_result
    def check_if_true?
        
          if @card_selected.uniq { |card| card.color }.length == 2
            @set_result = false
          end
          if @card_selected.uniq { |card| card.shade }.length == 2
            @set_result = false
          end
          if @card_selected.uniq { |card| card.shape }.length == 2
            @set_result = false
          end
          if @card_selected.uniq { |card| card.number }.length == 2
            @set_result = false
          end  
              
    end

    # The table will be update according to the @set_result. The new card will be deawed, the #deck_nnumber will 
    # be changed, the player score will also be chanded.
    def reset_table
        sleep 0.5
        @card_selected[0].remove_bottom
        @card_selected[1].remove_bottom
        @card_selected[2].remove_bottom # remove all the cards from selection zone.

          if @set_result == true
            for i in 0..2 do
                @card_on_table[@card_selected[i].position] = Card.new(@deck.shift, @card_selected[i].position) 
                if @deck.length == 0
                    @end_game = true
                    break
                end
                @card_selected[i].remove_top
                sleep 0.1
                @card_on_table[@card_selected[i].position].draw_top
            end
        
            @deck_number.text = "Deck:  " + @deck.length.to_s
            @players[@player_playing].add_score 
        else
            @players[@player_playing].drop_score # if the selection is wrong, the score will be dropped by 1             
          end

        @card_selected.clear  
        @set_result = true 
        @player_playing = -1  # reset the above instance variables.
    end


end
  
