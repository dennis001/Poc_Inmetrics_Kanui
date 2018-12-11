require_relative 'suport_objetos'


class Login < Appium::Driver
  include SuporteObjetos

  def initialize
    #Credenciais
    @email = 'form_login_email'
    @senha = 'form_login_password'
    #botões
    @btnEnter = 'regist_login_user_button_enter'
    @hometask = 'list_of_titles'
    #mensagens
    @erroLogin = 'dialog_info_text'
  end

  def preencher_email(email)
    id(@email).send_key (email)
  end

  def preencher_senha(senha)
    id(@senha).send_key (senha)
  end

  def logar_sucesso(credenciais)
    preencher_credenciais_validas(credenciais)
    id(@btnEnter).click
  end

  def logar_com_falha(credenciais)
    preencher_credenciais_invalidas(credenciais)
    id(@btnEnter).click
  end

  def mensagenErro

      result = ''
      wait {result = find_element(:id, @erroLogin).text}
      if result == "Falha no login Login ou senha incorretos"
        puts result
      else
        find_element(xpath: "//android.widget.TextView[2]")
      end
      return result

  end

end
