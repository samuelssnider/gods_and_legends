class CreateMythologies < ActiveRecord::Migration[5.1]
  def change
    create_table :mythologies do |t|
      t.string :name
      t.text :origin_story

      t.timestamps
    end
  end
end
