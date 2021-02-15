# supports.rb
# This file contains support functions and some constants that will be used in the game

# constants
CARD_POSITION_X = [100, 420, 740, 1060, 100, 420, 740, 1060, 100, 420, 740, 1060]
CARD_POSITION_Y = [120, 120, 120, 120, 300, 300, 300, 300, 480, 480, 480, 480]
BLOCK_POSITION_X = [320, 570, 820]
BLOCK_POSITION_Y = [740, 740, 740]
CARD_WIDTH = 200
CARD_HEIGHT = 130


# functions
def set_table
    
    # set the interface attribute
    set background: 'teal'
    set title: 'Set Game'
    set width: 1360
    set height: 960

    # set the bottom selection zone
    selection_zone = Rectangle.new(
        x: 300, y: 720,
        width: 760, height: 180,
        color: 'red'
      )

    # set the answer button for player 1
    button_1 = Circle.new(
        x: 180, y: 810,
        radius: 90,
        sectors: 60,
        color: 'fuchsia',      
      )
    
    text_1 = Text.new(
        "1",
        x: 140, 
        y: 710,
        size: 140,
        color: 'blue' 
      )

    # set the answer button for player 2
    button_2 = Circle.new(
        x: 1180, y: 810,
        radius: 90,
        sectors: 60,
        color: 'olive',      
      )
    
      text_1 = Text.new(
        "2",
        x: 1140, 
        y: 710,
        size: 140,
        color: 'blue' 
      )

    
    # set the score board
    scoreboard = Rectangle.new(
        x: 20, y: 20,
        width: 250, height: 80,
        color: 'brown',
      )

    player1_text = Text.new(
        "Player 1 :   ",
        x: 30, 
        y: 20,
        size: 30,
        color: 'fuchsia' 
      )

    player2_text = Text.new(
        "Player 2 :   ",
        x: 30, 
        y: 60,
        size: 30,
        color: 'olive' 
      )
    
      # game logo
    game_logo = Image.new(
        'Cards/game_logo.png',
        x: 1090, y: 20,
        width: 180, height: 90,       
      )
    
      # deck board
      deck_board = Rectangle.new(
        x: 580, y: 25,
        width: 200, height: 50,
        color: 'silver'  
      )

      # shuffle button
      shuffle_button = Rectangle.new(
        x: 580, y: 640,
        width: 200, height: 50,
        color: 'random'  
      )

      shuffle_text = Text.new(
        "SHUFFLE",
        x: 610, 
        y: 645,
        size: 30,
        color: 'random' 
      )
end

# game over page
def game_over
    Rectangle.new(
        x: 0, y: 0,
        width: 1360, height: 960,
        color: 'silver'  
      )

    Text.new(
        "GAME OVER!",
        x: 600, 
        y: 400,
        size: 60,
        color: 'random' 
      )
end