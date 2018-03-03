class AddMythologyToEvent < ActiveRecord::Migration[5.1]
  def change
    add_reference :events, :mythology, foreign_key: true
  end
end
