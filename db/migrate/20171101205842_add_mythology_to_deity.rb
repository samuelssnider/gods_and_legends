class AddMythologyToDeity < ActiveRecord::Migration[5.1]
  def change
    add_reference :deities, :mythology, foreign_key: true
  end
end
