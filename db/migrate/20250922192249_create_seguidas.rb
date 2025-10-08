class CreateSeguidas < ActiveRecord::Migration[8.0]
  def change
    create_table :seguidas do |t|
      t.references :usuario, foreign_key: { to_table: :usuarios }
      t.references :seguidor, foreign_key: { to_table: :usuarios }

      t.timestamps
    end
  end
end
