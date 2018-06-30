class AddImageToDomains < ActiveRecord::Migration[5.1]
  def change
    add_column :domains, :image, :string
  end
end
