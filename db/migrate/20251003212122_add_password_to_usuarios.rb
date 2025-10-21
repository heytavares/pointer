class AddPasswordToUsuarios < ActiveRecord::Migration[8.0]
  def change
    add_column :usuarios, :password, :string
  end
end
