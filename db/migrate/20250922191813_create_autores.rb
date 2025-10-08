class CreateAutores < ActiveRecord::Migration[8.0]
  def change
    create_table :autores do |t|
      t.string :nome
      t.text :bio

      t.timestamps
    end
  end
end
