Dado(/^que eu veja tela de menu do aplicativo$/) do
  @home = Home.new
  @home.home_logo
  @home.menutoobar
end

Quando(/^utilizo um "([^"]*)"$/) do |credenciais|
@login = Login_sucesso.new
@login.logar(@credenciais)
end

Entao(/^vejo a tela inicial do aplicativo$/) do
  pending # Write code here that turns the phrase above into concrete actions
end
