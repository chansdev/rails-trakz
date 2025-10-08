class CreateAvaliacaos < ActiveRecord::Migration[8.0]
  def change
    create_table :avaliacaos do |t|
      t.references :usuario, foreign_key: { to_table: :usuarios }
      t.references :musica, foreign_key: { to_table: :musicas }
      t.text :comentario
      t.float :nota

      t.timestamps
    end
  end
end
