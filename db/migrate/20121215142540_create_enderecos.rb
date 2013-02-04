class CreateEnderecos < ActiveRecord::Migration
  def change
    create_table :enderecos do |t|
      t.string :logradouro
      t.string :numero
      t.string :complemento
      t.string :bairro
      t.string :cidade
      t.string :uf
      t.float :longitude
      t.float :latitude
      t.boolean :gmaps
      t.integer :rota_id
      t.integer :origem_id
      t.integer :destino_id
      t.timestamps
    end
  end
end
