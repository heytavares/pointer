json.extract! chamado, :id, :titulo, :descricao, :funcionario_id, :categoria, :prioridade, :status, :data_vencimento, :created_at, :updated_at
json.url chamado_url(chamado, format: :json)
