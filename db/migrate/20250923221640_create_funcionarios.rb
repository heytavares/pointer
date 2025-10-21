class CreateFuncionarios < ActiveRecord::Migration[8.0]
  def change
    create_table :funcionarios do |t|
      t.string :nome
      t.string :email
      t.string :departamento
      t.string :cargo
      t.string :telefone
      t.date :data_admissao
      t.decimal :salario
      t.string :status

      t.timestamps
    end
  end
end
