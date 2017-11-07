class AddImageToDeity < ActiveRecord::Migration[5.1]
  def change
    add_column :deities, :image, :string, default: "#{deity.name}.jpg"
  end
end
