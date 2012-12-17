class CreateAssinanteNewsletters < ActiveRecord::Migration
  def change
    create_table :assinante_newsletters do |t|
      t.string :email
      t.timestamps
    end
  end
end
