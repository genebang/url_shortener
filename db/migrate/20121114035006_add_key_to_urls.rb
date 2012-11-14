class AddKeyToUrls < ActiveRecord::Migration
  
  def up
    add_column :urls, :user_id, :integer
  end
  
  def down
    remove_column :urls, :user_id
  end
  
end
