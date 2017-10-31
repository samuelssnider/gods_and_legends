class CreateBirths < ActiveRecord::Migration[5.1]
  def change
    create_table :births do |t|
      t.references :deity, foreign_key: true
      t.references :deity, foreign_key: true

      t.timestamps
    end
  end
end
