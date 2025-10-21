class CreateItemEstoques < ActiveRecord::Migration[8.0]
  def change
    create_table :item_estoques do |t|
      t.string :nome
      t.string :categoria
      t.integer :quantidade
      t.integer :estoque_minimo
      t.decimal :preco_unitario
      t.string :localizacao

      t.timestamps
    end
  end
end
