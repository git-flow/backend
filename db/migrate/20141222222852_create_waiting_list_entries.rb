class CreateWaitingListEntries < ActiveRecord::Migration
  def change
    create_table :waiting_list_entries do |t|
      t.string :email
      t.boolean :status

      t.timestamps null: false
    end
  end
end
