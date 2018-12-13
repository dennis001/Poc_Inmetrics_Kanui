class Cadastro_sucesso < Appium::Driver

  # ================================= SCREEN ======================================
  def initialize
    @menuButton = "android.widget.ImageButton"
    @btnEntrar = "Entrar"
    @btnCadastrar = "form_register_option"
    @emailInsert = Faker::Internet.email
    @email = "form_email"
    @password_num = Faker::Number.number(8)
    @password = "form_password"
    @confirm_pass = "form_password_confirm"
    @confirm_pass_num = @password_num
    @cpf = "form_cpf"
    @cpf_num = Faker::CPF.numeric
    @nome = Faker::Simpsons.character
    @name = "form_first_name"
    @lastNameText = Faker::Name.last_name
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
    @wellcome = "Seja bem vindo"
  end

  # ================================= METHODS ======================================
  def access_enter
    find_element(class: @menuButton).click
    text(@btnEntrar).click
    id(@btnCadastrar).click
  end

  def json_response
    ActiveSupport::JSON.decode @response.body
  end

  def insert_records
    id(@btnCadastrar).click
    id(@email).send_key @emailInsert
    email = @emailInsert
    id(@password).send_key @password_num
    senha = @password_num
    id(@confirm_pass).send_key @confirm_pass_num
    id(@cpf).send_key @cpf_num
    id(@name).send_key @nome
    scroll_to_exact("Sobrenome")
    id(@lastName).send_key @lastNameText

    puts email
    puts senha

    file = File.read('./features/support/default/credenciais.json')
    login_valido = {:login_valido => {:email => @emailInsert, :senha => @password_num, :nome => @nome}}
    json = JSON.generate(login_valido)
    json.merge!(file)
    puts json
    puts json.(file)


  end

  def insert_birthday
    id(@birthday).click
    id(@findYear).click
    scroll_to_exact(1996).click

    i =  @mouthView
    for i in 0..8
      if i != "March 1996" then
        id(@previousMonth).click
      else
        fail 'data nao encontrada'
      end
    end
  end

  def day_of_birthday
    find_element(id: @mouthView).find_element(xpath: "//android.view.View[@content-desc='15 março 1996']").click

    result = ''
    wait {result = find_element(id: @topDate).text}
    if result == "Sáb, 16 de mar"
      puts result
    else
      fail "data nao encontrada"
    end
    return result

  end

  def valid_cadastro
    id(@birthdayBtnDate).click
    id(@btnSave).click
    result = ''
    wait {result = text(@wellcome).text}
    if result = "Seja bem vindo"
      puts result
    else
      fail "elemento nao encontrado."
    end
  end

end
