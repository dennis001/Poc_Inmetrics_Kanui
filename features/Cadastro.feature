#language: pt
#utf-8

Funcionalidade:
 Eu como cliente
 Quero criar uma conta no aplicativo kanui
 Para estar por dentro dos produtos e promoções

  @cadastro_sucesso
    Cenario: Primeiro acesso ao aplicativo
      Dado que estou na home do aplicativo
          Quando toco no botão de login /cadastro
          E insiro meus dados
          Então valido meu cadastro
