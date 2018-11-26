class Cadastro_sucesso < Appium::Driver

  # ================================= SCREEN ======================================
  def initialize
    @menuButton = "android.widget.ImageButton"
    @btnEntrar = "Entrar"
    @btnCadastrar = "form_register_option"
    @emailInsert = Faker::Internet.email(@nome)
    @email = "form_email"
    @password_num = Faker::Number.number(8)
    @password = "form_password"
    @confirm_pass = "form_password_confirm"
    @confirm_pass_num = @password_num
    @cpf = "form_cpf"
    @cpf_num = Faker::CPF.numeric
    @nome = Faker::Simpsons.character
    @name = "form_first_name"
    @lastName = "form_last_name"
    @birthday = "form_birthday"
    @findYear = "date_picker_header_year"
    @previousMonth = "prev"
    @mouthView = "month_view"
    @birthdayBtnDate = "button1"
    @btnSave = "register_button"
    @srollView = "register_fragment"
  end
# ================================= METHODS ======================================
  def access_enter
    find_element(class: @menuButton).click
    text(@btnEntrar).click
    id(@btnCadastrar).click
  end

  def insert_records
    id(@btnCadastrar).click

    id(@email).click
    id(@email).send_key @emailInsert

    id(@password).click
    id(@password).send_key @password_num

    id(@confirm_pass).click
    id(@confirm_pass).send_key @confirm_pass_num

    id(@cpf).click
    id(@cpf).send_key @cpf_num

    id(@name).click
    id(@name).send_key @nome

    scroll_to_exact("Sobrenome")
    id(@lastName).click

    id(@birthday).click
    id(@findYear).click
    scroll_to_exact(1996).click

    i =  @mouthView
    for i in 0..7
      if i != "March 1996" then
        id(@previousMonth).click
        break
      end
    end
  
    id(@birthdayBtnDate).click 
    
    id(@btnSave).click
    

  end

end
