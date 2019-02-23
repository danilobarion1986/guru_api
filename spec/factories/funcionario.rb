# frozen_string_literal: true

FactoryBot.define do
  factory :funcionario, class: Funcionario do
    to_create(&:save)

    cliente
    sequence(:ident_func) { |n| "f_#{n}" }

    nome_func               { 'fulano' }
    email_func              { 'fulano@example.com' }
    fone_func               { '+55 11 1111-1111' }
    senhamd5_func           { '6546546546546546546' }
    dtultsenha_func         { 10.days.ago }
    optinvagasacontece_func { true }
    optinvagasexpress_func  { 0 }
    statusacesso_func       { 1 }
    sembloqlogin_func       { 0 }
    dtbloqprog_func         { Time.zone.today + 10.days }
    qtdeacessoerro_func     { 1 }
    removido_func           { false }
    masc_func               { false }
    admin_func              { false }
    dirconfapresempr_func   { false }
    diradmnavexintra_func   { false }
    diracessobancocom_func  { false }
    dircaptaberta_func      { false }
    diredtvaga_func         { false }
    dircompartvaga_func     { false }
    dircurconfid_func       { false }
    dircurabrir_func        { false }
    dircurvincvaga_func     { false }
    dircuraval_func         { false }

    cargodepto_func { 'Cargo teste' }
  end
end
