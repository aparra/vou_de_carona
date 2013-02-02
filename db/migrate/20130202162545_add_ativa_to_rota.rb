class AddAtivaToRota < ActiveRecord::Migration
  def change
    add_column :rota, :ativa, :boolean
  end
end
