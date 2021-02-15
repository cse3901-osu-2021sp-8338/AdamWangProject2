# card.rb
# contain the class "Card"

class Card
    attr_accessor :position, :cardNum, :color, :shade, :shape, :number, :image_top, :image_bottom

    # constructor
    # We can know all the attributes from the cardNum by the algorithm showing below.
    # cardNum is form 0 to 80. Position is from 0 to 11. All the other attributes are form 0 to 2.
    def initialize(cardNum, position)
      @cardNum = cardNum
      @color = cardNum/27
      @shade = cardNum%27/9
      @shape = cardNum%9/3
      @number = cardNum%3
      @position = position
    end
  
    # function to draw the card on the card display zone.
    def draw_top
      @image_top = Image.new(
        'Cards/' + @cardNum.to_s + '.png',
        x: CARD_POSITION_X[@position], y: CARD_POSITION_Y[@position],
        width: CARD_WIDTH, height: CARD_HEIGHT
      )
    end
  
    # function to draw the card on card selection zone
    def draw_bottom(position)
      @image_buttom = Image.new(
        'Cards/' + @cardNum.to_s + '.png',
        x: BLOCK_POSITION_X[position], y: BLOCK_POSITION_Y[position],
        width: CARD_WIDTH, height: CARD_HEIGHT
      )
    end
  
    # function to remove card from card display zone
    def remove_top
      @image_top.remove
    end
  
    # function to remoce card from card slection zone
    def remove_bottom
      @image_buttom.remove
    end
  
  
  end