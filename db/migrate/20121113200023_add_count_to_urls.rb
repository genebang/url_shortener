class AddCountToUrls < ActiveRecord::Migration
  
  def up
    add_column :urls, :count, :integer, :default => 0
  end
  
  def down
    remove_column :urls, :count
  end
  
end
