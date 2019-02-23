experiencia = Status.create(status: :experiencia)
contratado = Status.create(status: :contratado)
demitido = Status.create(status: :demitido)
aposentado = Status.create(status: :aposentado)

f = Funcionario.create(nome: 'Tripa Seca', email: 'tripaseca@email.com', status_id: contratado.id)
Funcionario.create(nome: 'Polegar Vermelho', email: 'polegarvermelho@email.com', status_id: contratado.id)
Funcionario.create(nome: 'Racha Cuca', email: 'rachacuca@email.com', status_id: contratado.id)
Funcionario.create(nome: 'Rosa A. Rumorosa', email: 'rosaarumorosa@email.com', status_id: experiencia.id)
Funcionario.create(nome: 'Capataz', email: 'capataz@email.com', status_id: demitido.id)
Funcionario.create(nome: 'Dunga', email: 'dunga@email.com', status_id: experiencia.id)
Funcionario.create(nome: 'Alma Negra', email: 'almanegra@email.com', status_id: aposentado.id)
Funcionario.create(nome: 'Quase Nada', email: 'quasenada@email.com', status_id: demitido.id)
Funcionario.create(nome: 'Bruxa Baratuxa', email: 'bruxabaratuxa@email.com', status_id: aposentado.id)
Funcionario.create( nome: 'Poucas Trancas', email: 'poucastranca@email.com', status_id: aposentado.id)

Experiencia.create(titulo: 'VAGAS.com', funcionario_id: f.id)
Experiencia.create(titulo: 'Itaú', funcionario_id: f.id)


