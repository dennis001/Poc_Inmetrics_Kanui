class Home < Appium::Driver

  # ================================= SCREEN ======================================
  def initialize
    @logoApp = "image_logo"
    @menuButton = "android.widget.ImageButton"
    @btnEntrar = "Entrar"
  end

  def home_logo
    id(@logoApp).click
  end

  def menutoobar
    find_element(class: @menuButton).click
    text(@btnEntrar).click
  end
end
