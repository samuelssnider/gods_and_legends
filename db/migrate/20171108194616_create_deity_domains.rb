class CreateDeityDomains < ActiveRecord::Migration[5.1]
  def change
    create_table :deity_domains do |t|
      t.references :deity, foreign_key: true
      t.references :domain, foreign_key: true

      t.timestamps
    end
  end
end
