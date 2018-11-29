module SuporteObjetos

    def busca_datapool(credenciais)
        env_data_pool = ENV['DATA_POOL']

        case env_data_pool
        when "HOMOLOG"
            return CREDENCIAIS[credenciais.gsub(' ', '_').to_sym]
        else     
            raise "Nenhum datapoolencontrado para o parâmetro informado, verifique se o datapooldesejado está corretamente mapeado em config/cucumber.yml"
        end
    end
end