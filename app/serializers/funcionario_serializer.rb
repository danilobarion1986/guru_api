# frozen_string_literal: true

class FuncionarioSerializer < ActiveModel::Serializer
  attributes %i[id nome status]

  def status
    object.object[:status]
  end
end
