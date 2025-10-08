class CreateMusicas < ActiveRecord::Migration[8.0]
  def change
    create_table :musicas do |t|
      t.string :nome
      t.references :autor, foreign_key: { to_table: :autores }

      t.timestamps
    end
  end
end
