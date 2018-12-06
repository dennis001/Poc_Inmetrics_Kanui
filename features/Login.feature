#language: pt
#utf-8

Funcionalidade:
 Eu como cliente
 Quero acessar a minha conta no aplicativo kanui
 Para olhar novas ofertas do site

 @login_valido
 Cenario: Login de sucesso no aplicativo utilizando email e senha.
 Dado que eu veja tela de menu do aplicativo
 Quando utilizo um "login valido"
 Entao vejo a tela inicial do aplicativo

 @login_invalido @wip
 Cenario: Login sem sucesso no aplicativo utilizando email e senha invalidos/ nao existentes.
 Dado que eu veja tela de menu do aplicativo
 Quando digito meus dados incorretamente com meu "login invalido"
 Entao vejo o pop-up de erro de login
