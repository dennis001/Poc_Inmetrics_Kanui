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
      find_element(xpath: "//android.widget.TextView[2]")

      result = ''
      wait {result = find_element(xpath: "/hierarchy/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.TextView[2]").text}
      if result == "Falha no login Login ou senha incorretos"
        puts result
      else
        fail "data nao encontrada"
      end
      return result

  end

end
