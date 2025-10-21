class ItemEstoque < ApplicationRecord
  validates :nome, presence: true
  validates :quantidade, numericality: { greater_than_or_equal_to: 0 }
  validates :estoque_minimo, numericality: { greater_than_or_equal_to: 0 }
  validates :preco_unitario, numericality: { greater_than_or_equal_to: 0 }
  
  # CORRIGIDO
  enum :categoria, { 
    escritorio: 'escritório', 
    informatica: 'informática', 
    limpeza: 'limpeza', 
    manutencao: 'manutenção',
    outros: 'outros'
  }
  
  def estoque_baixo?
    quantidade <= estoque_minimo
  end
  
  def valor_total
    quantidade * preco_unitario
  end
end