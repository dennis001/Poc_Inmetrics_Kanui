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
    end

    def preencher_senha(senha)
      id(@senha).send_key (senha)
    end

    def preencher_credenciais(credenciais)
      @dados = busca_datapool(credenciais)
      preencher_email @dados[:email]
      preencher_senha @dados[:senha]

    end

    def logar(credenciais)
      preencher_credenciais(credenciais)
      id(@btnEnter).click
    end

  end
