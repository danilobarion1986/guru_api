# frozen_string_literal: true

require 'rails_helper'

describe V1::FuncionariosController, type: :request do
  let(:funcionario) { create(:funcionario) }
  let(:cliente) { create(:cliente, reqvaga_cli: 37) }

  let(:permissoes) do
    { permissoes:
      { cadastrar_requisitante: true,
        criar_requisicao: true,
        cadastrar_pessoas_aprovacao_bloco: true,
        acompanhar_requisicao: true,
        sem_responsavel_cadastro_requisitante: true } }
  end

  context 'quando administrador' do
    let(:funcionario_administrador) do
      create(:funcionario,
             cliente: cliente,
             admin_func: true)
    end
    let(:reqvaga_gestor) { create(:reqvaga_gestor, codfuncgestor_rv: funcionario_administrador.id) }

    let(:permissoes_administrador) do
      permissoes.to_json
    end

    before { reqvaga_gestor }

    describe 'v1/requisicoes/permissoes' do
      let(:headers) do
        { 'x-company-id': funcionario_administrador.cliente.id,
          'x-user-id': funcionario_administrador.id }
      end

      it 'retorna Status 200 com parametros corretos' do
        get '/v1/requisicoes/permissoes', headers: headers

        expect(response).to have_http_status(:ok)
      end

      it 'retorna as permissões do funcionario administrador' do
        get '/v1/requisicoes/permissoes', headers: headers

        expect(response.body).to include(permissoes_administrador)
      end
    end

    describe 'v1/requisicoes/permissoes com HEADER inválido' do
      let(:headers) { { 'x-company-id': funcionario_administrador.cliente.id } }
      let(:header_incorreto) do
        { 'x-company-id': '99999',
          'x-user-id': '99999' }
      end

      it 'retorna Status 404 na falta de HEADER' do
        get '/v1/requisicoes/permissoes'

        expect(response).to have_http_status(404)
      end

      it 'retorna Status 404 com HEADER incorreto' do
        get '/v1/requisicoes/permissoes', headers: header_incorreto

        expect(response).to have_http_status(:not_found)
      end
    end
  end

  context 'quando funcionario com direito de acesso para cadastrar requisitantes ' do
    let(:funcionario_permitido) do
      create(:funcionario,
             cliente: cliente,
             dirreqvagacadrequisitante_func: true,
             dirreqvaga_func: true)
    end

    let(:permissoes_funcionario_permitido) do
      permissoes[:permissoes][:cadastrar_pessoas_aprovacao_bloco] = false
      permissoes.to_json
    end

    let(:reqvaga_gestor) { create(:reqvaga_gestor, codfuncgestor_rv: funcionario_permitido.id) }

    before { reqvaga_gestor }

    describe 'v1/requisicoes/permissoes' do
      let(:headers) do
        { 'x-company-id': funcionario_permitido.cliente.id,
          'x-user-id': funcionario_permitido.id }
      end

      it 'retorna Status 200 com parametros corretos' do
        get '/v1/requisicoes/permissoes', headers: headers

        expect(response).to have_http_status(:ok)
      end

      it 'retorna as permissões do funcionario não administrador' do
        get '/v1/requisicoes/permissoes', headers: headers

        expect(response.body).to include(permissoes_funcionario_permitido)
      end
    end

    describe 'v1/requisicoes/permissoes com HEADER inválido' do
      let(:headers) { { 'x-company-id': funcionario_permitido.cliente.id } }
      let(:header_incorreto) do
        { 'x-company-id': '99999',
          'x-user-id': '99999' }
      end

      it 'retorna Status 404 na falta de HEADER' do
        get '/v1/requisicoes/permissoes'

        expect(response).to have_http_status(404)
      end

      it 'retorna Status 404 com HEADER incorreto' do
        get '/v1/requisicoes/permissoes', headers: header_incorreto

        expect(response).to have_http_status(:not_found)
      end
    end
  end

  context 'quando funcionario sem permissoes ' do
    let(:funcionario_sem_permissoes) { create(:funcionario, cliente: cliente) }

    let(:permissoes_funcionario_sem_permissoes) do
      permissoes[:permissoes][:cadastrar_requisitante] = false
      permissoes[:permissoes][:criar_requisicao] = false
      permissoes[:permissoes][:cadastrar_pessoas_aprovacao_bloco] = false
      permissoes[:permissoes][:acompanhar_requisicao] = false
      permissoes.to_json
    end

    describe 'v1/requisicoes/permissoes' do
      let(:headers) do
        { 'x-company-id': funcionario_sem_permissoes.cliente.id,
          'x-user-id': funcionario_sem_permissoes.id }
      end

      it 'retorna Status 200 com parametros corretos' do
        get '/v1/requisicoes/permissoes', headers: headers

        expect(response).to have_http_status(:ok)
      end

      it 'retorna as permissões do funcionario não administrador' do
        get '/v1/requisicoes/permissoes', headers: headers

        expect(response.body).to include(permissoes_funcionario_sem_permissoes)
      end
    end

    describe 'v1/requisicoes/permissoes com HEADER inválido' do
      let(:headers) { { 'x-company-id': funcionario_sem_permissoes.cliente.id } }
      let(:header_incorreto) do
        { 'x-company-id': '99999',
          'x-user-id': '99999' }
      end

      it 'retorna Status 404 na falta de HEADER' do
        get '/v1/requisicoes/permissoes'

        expect(response).to have_http_status(404)
      end

      it 'retorna Status 404 com HEADER incorreto' do
        get '/v1/requisicoes/permissoes', headers: header_incorreto

        expect(response).to have_http_status(:not_found)
      end
    end
  end
end
