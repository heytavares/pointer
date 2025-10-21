json.extract! funcionario, :id, :nome, :email, :departamento, :cargo, :telefone, :data_admissao, :salario, :status, :created_at, :updated_at
json.url funcionario_url(funcionario, format: :json)
