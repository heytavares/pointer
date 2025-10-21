json.extract! item_estoque, :id, :nome, :categoria, :quantidade, :estoque_minimo, :preco_unitario, :localizacao, :created_at, :updated_at
json.url item_estoque_url(item_estoque, format: :json)
