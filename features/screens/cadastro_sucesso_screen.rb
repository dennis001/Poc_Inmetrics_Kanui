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
    @nextMonth = "next"
    @mouthView = "month_view"
    @dayOfDate = "16"
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
    #hide_keyboard
    email = @emailInsert

    id(@password).send_key @password_num
    senha = @password_num
    #hide_keyboard

    id(@confirm_pass).send_key @confirm_pass_num
    #hide_keyboard

    id(@cpf).send_key @cpf_num
    hide_keyboard

    id(@name).send_key @nome
    nome = @nome
    #hide_keyboard

    scroll_to_exact("Sobrenome")
    id(@lastName).send_key @lastNameText
    #hide_keyboard

    login_valido = File.read('./features/support/default/credenciais.json')
    login_valido = {:login => {:email => @emailInsert, :senha => @password_num, :nome => @nome}}
    login_valido = File.read('./features/support/default/credenciais.json') << JSON.pretty_generate(login_valido)
    #puts login_valido

  end

  def insert_birthday
    id(@birthday).click
    id(@findYear).click
    scroll_to_exact(1996).click
  end

  def day_of_birthday



    i =  @topDate
      if i < "sáb, 16 de mar"
        id(@nextMonth).click
        i == "sáb, 16 de mar"
      elsif i > "sáb, 16 de mar"
        id(@previousMonth).click
      else i == "sáb, 16 de mar"
        puts "data encontrada"
      end

      time = Time.new

      if time != 16
        find_elements(class: "android.view.View")[16].click
      else time == 16
        puts time.day
      end

    result = ''
    wait {result = find_element(id: @topDate).text}
    if result == "sáb, 16 de mar"
      puts result
    else
      fail "data nao é igual a sáb, 16 de mar"
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
