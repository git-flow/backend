class RemoveDevise < ActiveRecord::Migration
  def change
    # We drop the user's table, we won't need it, at least
    # not the version that came with Devise
    drop_table :users
  end
end
