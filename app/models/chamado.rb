class Chamado < ApplicationRecord
  belongs_to :funcionario
  
  validates :titulo, presence: true
  validates :descricao, presence: true
  validates :categoria, presence: true
  validates :prioridade, presence: true
  
  # CORRIGIDO
  enum :categoria, { 
    tecnico: 'técnico', 
    rh: 'rh', 
    financeiro: 'financeiro', 
    estoque: 'estoque',
    outros: 'outros'
  }
  
  # CORRIGIDO  
  enum :prioridade, { 
    baixa: 'baixa', 
    media: 'média', 
    alta: 'alta', 
    urgente: 'urgente' 
  }
  
  # CORRIGIDO
  enum :status, { 
    aberto: 'aberto', 
    em_andamento: 'em_andamento', 
    resolvido: 'resolvido', 
    fechado: 'fechado' 
  }
  
  scope :ativos, -> { where(status: ['aberto', 'em_andamento']) }
  scope :atrasados, -> { where('data_vencimento < ? AND status IN (?)', Date.current, ['aberto', 'em_andamento']) }
  
  def atrasado?
    data_vencimento && data_vencimento < Date.current && ['aberto', 'em_andamento'].include?(status)
  end
end