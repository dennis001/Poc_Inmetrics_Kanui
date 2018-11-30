module SuporteObjetos

  def busca_datapool(credenciais)
    JSON.parse(File.read('./support/default/credenciais.json'))
    return CREDENCIAIS[credenciais.gsub(' ', '_').to_sym]
  end
end
