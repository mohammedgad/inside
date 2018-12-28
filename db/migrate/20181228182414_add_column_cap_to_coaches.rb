class AddColumnCapToCoaches < ActiveRecord::Migration[5.2]
  def change
    add_column :coaches, :cap, :integer
  end
end
