# frozen_string_literal: true

<<<<<<< HEAD
class AddRolesToUsers < ActiveRecord::Migration[5.0]
=======
class AddRolesToUsers < ActiveRecord::Migration[5.2]
>>>>>>> ca8170c5bcc79d6cf8b14e3aca0e95b86eb60666
  def up
    add_column :users, :role, :integer, default: 0, null: false
    add_index :users, :role
  end

  def down
    remove_column :users, :role, :integer, default: 0, null: false
    remove_index :users, :role
  end
end
