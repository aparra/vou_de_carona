class CreateRota < ActiveRecord::Migration
  def change
    create_table :rota do |t|
      t.integer :caroneiro_id
      t.integer :origem_id
      t.integer :destino_id
      t.datetime :publicada_em
      t.string :nome
      t.timestamps
    end
  end
end
