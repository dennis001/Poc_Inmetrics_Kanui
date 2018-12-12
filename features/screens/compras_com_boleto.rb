#require_relative 'suport_objetos'

class CompBoleto < Appium::Driver
  #  include SuporteObjetos

  # ================================= SCREEN ======================================
  def initialize
    #botões
    @tabMenu = 'pager_title_strip' #id
    @btnComprar = 'prod_detail_button_buy' #id
    @tamanho = '38' #text
    @carrinho = 'menu_cart' #id
    @btnCheckout = 'cart_bottom_button' #id
    @endCheckout = 'finish_order_button' #id
    #itens
    @promo3Tenis = '//android.widget.RelativeLayout[3]' #xpath
    @tenis = '//android.widget.LinearLayout[1]' #text
    @deliveryPayment = 'payment_method_radio_button' #id
    @sucess = 'Order placed successfully!' #text

  end

  # ================================= METHODS ======================================
  def calcados
    2.times {Appium::TouchAction.new.swipe(start_x:1034, start_y:282, end_x:52, end_y:282, durattion:600).perform}

    until exists{ text("CALÇADOS")} do
      Appium::TouchAction.new.swipe(start_x:1034, start_y:282, end_x:52, end_y:282, durattion:600).perform
    end

  end

  def promo
    find_element(xpath: @promo3Tenis).click
  end

  def selec_product
    find_element(xpath: @tenis).click
    id(@btnComprar).click
    text(@tamanho).click
  end

end
