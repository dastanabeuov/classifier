# frozen_string_literal: true

class AddRolesToUsers < ActiveRecord::Migration[5.2]
  def up
    add_column :users, :role, :integer, default: 0, null: false
    add_index :users, :role
  end

  def down
    remove_column :users, :role, :integer, default: 0, null: false
    remove_index :users, :role
  end
end
