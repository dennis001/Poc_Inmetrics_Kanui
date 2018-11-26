Dado("que estou na home do aplicativo") do
  @home = Home.new
  @home.home_logo
end

Quando("toco no botão de login \/cadastro") do
  @sucesso = Cadastro_sucesso.new
  @sucesso.access_enter

end

Quando("insiro meus dados") do
  @sucesso.insert_records
end

Então("valido meu cadastro") do
  pending # Write code here that turns the phrase above into concrete actions
end
