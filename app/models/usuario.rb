class Usuario < ApplicationRecord
  # ⭐⭐ REMOVA todas as validações de password ⭐⭐
  validates :nome, presence: true
  validates :email, presence: true, uniqueness: true
  # ⭐⭐ NÃO tenha esta linha: ⭐⭐
  # validates :password, presence: true, length: { minimum: 6 }, on: :create
  
  enum :tipo, {
    administrador: 'admin',
    membro: 'membro'
  }
  
  def admin?
    tipo == 'administrador'
  end
end