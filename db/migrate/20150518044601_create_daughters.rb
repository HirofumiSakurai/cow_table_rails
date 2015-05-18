class CreateDaughters < ActiveRecord::Migration
  def change
    create_table :daughters do |t|
      t.integer :owner_id

      t.timestamps
    end
  end
end
