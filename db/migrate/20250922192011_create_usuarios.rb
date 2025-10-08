class CreateUsuarios < ActiveRecord::Migration[8.0]
  def change
    create_table :usuarios do |t|
      t.string :nome
      t.text :email
      t.text :username
      t.text :senha
      t.date :data_nasc

      t.timestamps
    end
  end
end
