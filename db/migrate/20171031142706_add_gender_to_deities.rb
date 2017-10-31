class AddGenderToDeities < ActiveRecord::Migration[5.1]
  def change
    add_column :deities, :gender, :integer
  end
end
