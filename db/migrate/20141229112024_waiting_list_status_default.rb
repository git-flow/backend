class WaitingListStatusDefault < ActiveRecord::Migration
  def change
    reversible do |dir|
      change_table :waiting_list_entries do |t|
        dir.up { t.change :status, :boolean, default: false }
        dir.down { t.change :status, :boolean }
      end
    end
  end
end
