class CreateBirths < ActiveRecord::Migration[5.1]
  def change
    create_table :births do |t|
      t.integer :parent_id
      t.integer :child_id

      t.timestamps
    end
  end
end
