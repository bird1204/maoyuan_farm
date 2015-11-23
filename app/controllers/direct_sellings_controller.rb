class DirectSellingsController < ApplicationController
  def show
    @friends = %w(吉伯特的蛋黃小販 趴特萬的農產品 萬特趴的農產品 特伯吉的農產品)
    case params[:id]
    when '1'
      @title = '吉伯特的蛋黃小販'
      @desc = '我賣蛋黃哥'
      @image = 'market_example.jpg'
      @content = '<br>好吃的蛋黃來囉^^<br>小編每年都要訂『丘家』蛋黃來做月餅過中秋<br>現在開放預購囉~<br>0992-120-412 尾翼哥'
    when '2'
      @title = '趴特萬的農產品'
      @desc = '我賣花'
      @image = '1700866_L.jpg'
      @content = '<br>趴特萬的農產品<br>0992-120-412 趴特萬'
    when '3'
      @title = '萬特趴的農產品'
      @desc = '我賣草'
      @image = '1905940_L.jpg'
      @content = '<br>萬特趴的農產品<br>0992-120-412 萬特趴'
    when '4'
      @title = '特伯吉的農產品'
      @desc = '我賣土'
      @image = 'market_example.jpg'
      @content = '<br>特伯吉的農產品<br>0992-120-412 特伯吉'
    end
  end
end
