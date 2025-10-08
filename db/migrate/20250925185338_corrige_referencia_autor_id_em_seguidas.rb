class CorrigeReferenciaAutorIdEmSeguidas < ActiveRecord::Migration[8.0]
  def change
    remove_foreign_key :seguidas, column: :autor_id rescue nil

    add_foreign_key :seguidas, :usuarios, column: :autor_id
  end
end
