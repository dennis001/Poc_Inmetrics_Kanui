Dado(/^que eu veja tela de menu do aplicativo$/) do
  @home = Home.new
  @home.home_logo
  @home.menutoobar
end

Quando(/^utilizo um "([^"]*)"$/) do |login_valido|
@login = Login.new
@login.logar_sucesso(login_valido)
end

Entao(/^vejo a tela inicial do aplicativo$/) do
  @home.homeLogada
end

Quando("digito meus dados incorretamente com meu {string}") do |login_invalido|
  @login = Login.new
  @login.logar_com_falha(login_invalido)
end

Entao("vejo o pop-up de {string} de login") do |erro|
  erro = @login
  expect(erro.mensagenErro).to eq(erro)
end
