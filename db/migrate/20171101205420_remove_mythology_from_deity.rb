class RemoveMythologyFromDeity < ActiveRecord::Migration[5.1]
  def change
    remove_column :deities, :mythology, :integer
  end
end
