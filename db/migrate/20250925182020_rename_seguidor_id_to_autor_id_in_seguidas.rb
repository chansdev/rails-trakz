class RenameSeguidorIdToAutorIdInSeguidas < ActiveRecord::Migration[7.0] # ou 8.0 dependendo da sua versão
  def change
    rename_column :seguidas, :seguidor_id, :autor_id
  end
end
