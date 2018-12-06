require_relative 'suport_objetos'


class Login_sucesso < Appium::Driver
  include SuporteObjetos

  def initialize
    @email = 'form_login_email'
    @senha = 'form_login_password'
    @btnEnter = 'regist_login_user_button_enter'
  end



  def preencher_email(email)
    id(@email).send_key (email)
    result = ''
    wait {result = text(email).text}
    if result =! (email)
      fail "email não preenchido"
    end
  end

  def preencher_senha(senha)
    id(@senha).send_key (senha)
    result = ''
    wait {result = text(senha).text}
    if result =! (senha)
      fail "senha não preenchida"
    end
  end

  def preencher_credenciais(credenciais)
    @credenciais = JSON.parse!(File.read('./features/support/default/credenciais.json'))
    preencher_email @credenciais["email"] => 'georgianne@fisherlakin.com'
    preencher_senha @credenciais["senha"]
  end

  def logar(credenciais)
    preencher_credenciais(credenciais)
    id(@btnEnter).click
  end

end
