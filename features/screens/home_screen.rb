class Home < Appium::Driver

  # ================================= SCREEN ======================================
  def initialize
    @logoApp = "image_logo"
    @menuButton = "android.widget.ImageButton"
    @btnEntrar = "Entrar"
    @btnlogin = 'android.widget.ImageButton'
  end

  def home_logo
    id(@logoApp).click
  end

  def menutoobar
    find_element(class: @menuButton).click
    text(@btnEntrar).click
  end

  def homeLogada
    find_element(class: @btnlogin).click
  end
end
