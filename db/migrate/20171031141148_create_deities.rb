class CreateDeities < ActiveRecord::Migration[5.1]
  def change
    create_table :deities do |t|
      t.string :name
      t.integer :tier
      t.text :description
      t.integer :mythology
      t.string :classification

      t.timestamps
    end
  end
end
