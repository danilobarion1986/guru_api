# frozen_string_literal: true

class Funcionario < Sequel::Model(:funcionarios)
  include ActiveModel::Serialization

  dataset_module do
    where :ativo, Sequel[:funcionarios][:excluido] =~ 0

    def listar(params)
      ativo
        .join(:status, id: :status_id)
        .por_ids(params[:ids])
        .select(Sequel[:funcionarios][:id], :nome, :status)
        .order(:nome)
        .por_pagina(params[:pagina], params[:tamanho])
    end

    def por_empresa(empresa_id)
      where(empresa_id: empresa_id)
    end

    def por_ids(ids)
      return self if ids.nil?

      where(cod_func: ids)
    end

    def por_pagina(pagina, tamanho)
      pagina = pagina || 1
      limite = tamanho || 10

      paginate(pagina, limite)
    end
  end
end
