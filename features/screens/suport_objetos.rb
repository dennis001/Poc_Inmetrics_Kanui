module SuporteObjetos

  def preencher_credenciais_validas(login_valido)
    file = File.read('./features/support/default/credenciais.json')
    @credenciais = JSON.parse(file)
    preencher_email @credenciais["login_valido"]["email"]
    preencher_senha @credenciais["login_valido"]["senha"]
  end

  def preencher_credenciais_invalidas(login_invalido)
    file = File.read('./features/support/default/credenciais.json')
    @credenciais = JSON.parse(file)
    preencher_email @credenciais["login_invalido"]["email"]
    preencher_senha @credenciais["login_invalido"]["senha"]
  end

  def tocar_elemento(element)
    find_element(element).click
  end

  def busca_datapool(credenciais)
    JSON.parse(File.read('./support/default/credenciais.json'))
    return CREDENCIAIS[credenciais.gsub(' ', '_').to_sym]
  end

end
