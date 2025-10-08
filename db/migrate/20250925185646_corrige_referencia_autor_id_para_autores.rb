class CorrigeReferenciaAutorIdParaAutores < ActiveRecord::Migration[8.0]
  def change
    remove_foreign_key :seguidas, column: :autor_id rescue nil

    add_foreign_key :seguidas, :autores, column: :autor_id
  end
end
