class CreateAmigos < ActiveRecord::Migration
  def change
    create_table :amigos do |t|
      t.integer :caroneiro_id
      t.integer :amigo_id
      t.timestamps
    end
  end
end
