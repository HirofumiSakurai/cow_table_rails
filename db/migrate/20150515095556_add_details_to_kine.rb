class AddDetailsToKine < ActiveRecord::Migration
  def change
    add_column :kine, :parent, :integer
  end
end
