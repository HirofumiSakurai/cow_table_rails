class CreateAiLogs < ActiveRecord::Migration
  def change
    create_table :ai_logs do |t|
      t.integer :cow_no
      t.date :date
      t.string :state

      t.timestamps
    end
  end
end
