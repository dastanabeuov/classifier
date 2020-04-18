class AddRolesToUsers < ActiveRecord::Migration[5.0]
  def up
    add_column :users, :admin, :boolean, default: false
    add_column :users, :manager, :boolean, default: false
    add_column :users, :moderator, :boolean, default: false
    add_column :users, :paid_user, :boolean, default: false
    add_column :users, :free_user, :boolean, default: false
    add_column :users, :guest, :boolean, default: true
  end

  def down
    remove_column :users, :admin, :boolean, default: false
    remove_column :users, :manager, :boolean, default: false
    remove_column :users, :moderator, :boolean, default: false
    remove_column :users, :paid_user, :boolean, default: false
    remove_column :users, :free_user, :boolean, default: false
    remove_column :users, :guest, :boolean, default: true
  end  
end
