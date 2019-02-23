# frozen_string_literal: true

FactoryBot.define do
  factory :funcionario, class: Funcionario do
    to_create(&:save)

    nome               { 'fulano' }
    email              { 'fulano@example.com' }
    status_id          { 1 }
  end
end
