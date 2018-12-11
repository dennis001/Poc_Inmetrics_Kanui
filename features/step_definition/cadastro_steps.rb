Dado("que estou na home do aplicativo") do
  @home = Home.new
  @home.home_logo
end

Quando("toco no botão de login \/cadastro") do
  @cadastro = Cadastro_sucesso.new
  @cadastro.access_enter

end

Quando("insiro meus dados") do
  @cadastro.insert_records
  @cadastro.insert_birthday
  @cadastro.day_of_birthday
end

Então("valido meu cadastro") do
  @cadastro.valid_cadastro
end
