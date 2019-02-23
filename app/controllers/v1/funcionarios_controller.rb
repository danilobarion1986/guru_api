# frozen_string_literal: true

class V1::FuncionariosController < ApplicationController
  def index
    funcionarios = Funcionario.listar(params)

    render json: funcionarios.all,
           each_serializer: FuncionarioSerializer
  end
end
