# Requisicao Service
Serviço para gerenciamento de requsições.

## Créditos
Responsáveis pelo desenvolvimento e manutenção desse projeto.


---

## Dependências

### FreeTDS

Linux:
```
$ sudo apt-get install freetds-dev
```
Mac:
```
$ brew install freetds
```

## Instalação/Uso

### Ambiente de desenvolvimento

```
bin/setup
bundle exec rails server
```

## Testes

A dependencia para rodar os testes são do Banco de dados Sqlserver.
Para rodar uma instância do serviço de banco de dados, basta a chamada do comando:

```
docker-compose up -d
```

Isso já irá levantar todos os serviços extras necessários, mas algumas configurações precisam
ser feitas para cada serviço

### Banco de dados

Para rodar os testes, é preciso carregar o schema no banco de dados de QA para um banco de testes
(Aquele levantando pelo docker-compose).

Para isso indique no arquivo __config/database.yml__ que o banco de desenvolvimento é o banco de dados
do ambiente de QA

Assim execute:

```
%> bundle exec rake db:schema:dump_models
```

Irá gerar apenas os schemas das tabelas que estão no arquivo __db/tables_to_dump.yml__


### Estrutura do banco de dados

Para os testes, é preciso ter um database com o mesmo nome configurado no __config/database.yml__.
Para isso, crie o database com o comando numa ferramenta de acesso ao banco de dados,
pode ser até o __tsql__, ferramenta provida pelo freetds-bin

Para conectar no banco pelo tsql, basta o comando

```
tsql -H localhost -U sa -p 1433 -P 'aquele-pwd-conf-acima'
```

Depois executar o comando de criar o database

```
create database [rqs-test]
go
--drop database [rqs-test]
```

Por fim, é preciso importar as tabelas com o schema já carregado anteriormente do banco de desenvolvimento.
Para isso, basta executar a rake task

```
%> RAILS_ENV=test bundle exec rake db:schema:load
```

Devido o banco importado não refletir completamente o schema de produção, é necessário executar algumas migrações. Para isso, execute o comando:

```
%> RAILS_ENV=test rake db:migrate
```

### Executando os testes

Os testes podem ser executados com o comando:

```
%> bundle exec rspec
```

Para uma execução continua e validação dos códigos, o comando abaixo deixa a execução sempre ativa.

```
%> bundle exec guard
```


## Contribuição
1. Clone o projeto!
2. Crie sua feature branch: `git checkout -b my-new-feature`
3. Commit suas mudanças: `git commit -am 'Add some feature'`
4. Envie seu branch para o repositório: `git push origin my-new-feature`
5. Envie um Pull Request :D
