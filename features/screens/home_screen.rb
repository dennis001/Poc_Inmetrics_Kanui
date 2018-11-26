class Home < Appium::Driver

  # ================================= SCREEN ======================================
  def initialize
    @logoApp = "image_logo"
  end

  def home_logo
    id(@logoApp).click
  end

end
