$datapool = {}

$datapool_credenciais = {
  "login_valido" => {
    "email" => "georgianne@fisherlakin.com",
    "senha" => "44501107"}
  }

  def get_datapool_value(datapool, key)
    env_data_pool = ENV['DATA_POOL']

    case env_data_pool
    when "HOMOLOG"
        $datapool = $datapool_credenciais
    else
        raise "Nenhum datapoolencontrado para o parâmetro informado, verifique se o datapooldesejado está corretamente mapeado em config/cucumber.yml"
    end
    return $datapool[datapool][key]

end
