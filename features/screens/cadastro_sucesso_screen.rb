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
    @dayOfDate = 16
    @topDate = "date_picker_header_date"
    @birthdayBtnDate = "button1"
    @btnSave = "register_button"
    @srollView = "register_fragment"
    @wellcome = "banner_image"
  end

  # ================================= METHODS ======================================
  def access_enter
    find_element(class: @menuButton).click
    text(@btnEntrar).click
    id(@btnCadastrar).click
  end

  def insert_records
    id(@btnCadastrar).click
    id(@email).send_key @emailInsert
    id(@password).send_key @password_num
    id(@confirm_pass).send_key @confirm_pass_num
    id(@cpf).send_key @cpf_num
    id(@name).send_key @nome
    scroll_to_exact("Sobrenome")
    id(@lastName).send_key @nome
  end

  def insert_birthday
    id(@birthday).click
    id(@findYear).click
    scroll_to_exact(1996).click

    i =  @mouthView
    for i in 0..7
      if i != "March 1996" then
        id(@previousMonth).click
      else
        puts 'data nao encontrada'
      end
    end
  end

  def day_of_birthday
    find_element(id: @mouthView).find_element(xpath: "//android.view.View[@content-desc='15 março 1996']").click

    result = ''
    wait {result = find_element(id: @topDate).text}
    if result = "Sáb, 16 de mar"
      puts result
    else
      puts "data nao encontrada"
    end
    return result

  end
  
  def valid_cadastro
    id(@birthdayBtnDate).click
    id(@btnSave).click
    result = ''
    wait {find_element(id: @wellcome).text}
    if result = "Seja bem vindo,"
      puts result
    else
      puts "valor não encontrado"
    end
    return result
  end

end
