class CreateTemplates < ActiveRecord::Migration
  def change
    create_table :templates do |t|
      t.integer :user_id
      t.string :name
      t.text :content

      t.timestamps null: false
    end
  end
end
