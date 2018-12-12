Dado("abro a ala de calçados") do
  @compras = CompBoleto.new
  @compras.calcados
end

Quando("clico na promocao {int} Tenis por {int}") do |int, int2|
  @compras.promo
end

Quando("seleciono o tenis desejado") do
  @compras.selec_product
end

Entao("finalizo minha compra com pagamento por boleto") do
  pending # Write code here that turns the phrase above into concrete actions
end
