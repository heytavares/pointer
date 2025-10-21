class CreateChamados < ActiveRecord::Migration[8.0]
  def change
    create_table :chamados do |t|
      t.string :titulo
      t.text :descricao
      t.references :funcionario, null: false, foreign_key: true
      t.string :categoria
      t.string :prioridade
      t.string :status
      t.date :data_vencimento

      t.timestamps
    end
  end
end
