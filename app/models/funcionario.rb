class Funcionario < ApplicationRecord
  has_many :chamados, dependent: :destroy
  
  validates :nome, presence: true
  validates :email, presence: true, uniqueness: true
  validates :departamento, presence: true
  validates :cargo, presence: true
  validates :data_admissao, presence: true
  
  enum :status, {
    ativo: 'ativo',
    inativo: 'inativo', 
    ferias: 'ferias'
  }
  
  def tempo_empresa
    return 0 unless data_admissao
    ((Date.current - data_admissao) / 365).floor
  end
end