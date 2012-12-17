class CreateCaroneiros < ActiveRecord::Migration
  def change
    create_table :caroneiros do |t|
      t.string :nome, :limit => 80
      t.string :twitter
      t.string :facebook
      t.string :email
      t.string :hashed_password
      t.timestamps
    end
  end
end
