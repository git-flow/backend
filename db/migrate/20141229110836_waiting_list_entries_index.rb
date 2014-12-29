class WaitingListEntriesIndex < ActiveRecord::Migration
  def change
    add_index :waiting_list_entries, :email, unique: true
  end
end
