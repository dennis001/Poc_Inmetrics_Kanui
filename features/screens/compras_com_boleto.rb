class CompBoleto < Appium::Driver

  # ================================= SCREEN ======================================
  def initialize
    #botões
    @tabMenu = 'pager_title_strip' #id
    @calcados = 'CALÇADOS' #text
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
  @driver.touch_actions.scroll(@tabMenu, 10, 100).perform 
end

end
