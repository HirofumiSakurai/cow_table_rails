class AddDetailsToAiLogs < ActiveRecord::Migration
  def change
    add_column :ai_logs, :owner_id, :integer
  end
end
