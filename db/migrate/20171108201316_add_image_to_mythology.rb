class AddImageToMythology < ActiveRecord::Migration[5.1]
  def change
    add_column :mythologies, :image, :string
  end
end
