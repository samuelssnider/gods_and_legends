class CreateEventActors < ActiveRecord::Migration[5.1]
  def change
    create_table :event_actors do |t|
      t.references :deity, foreign_key: true
      t.references :event, foreign_key: true
    end
  end
end
