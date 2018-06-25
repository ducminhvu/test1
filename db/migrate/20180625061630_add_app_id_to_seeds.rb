class AddAppIdToSeeds < ActiveRecord::Migration[5.1]
  def change
    add_column :seeds, :app_id, :integer
    add_index :seeds, :app_id
  end
end
