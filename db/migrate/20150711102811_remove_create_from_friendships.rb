class RemoveCreateFromFriendships < ActiveRecord::Migration
  def change
    remove_column :friendships, :create, :string
  end
end
