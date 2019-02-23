# frozen_string_literal: true

class FuncionarioSerializer < ActiveModel::Serializer
  attributes %i[nome email status]

  def status
    object[:status]
  end
end

