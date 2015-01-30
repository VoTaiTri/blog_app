class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :content
      t.references :entry, index: true
      t.references  :user, index: true

      t.timestamps null: false
    end
    add_index :comments, [:user_id, :entry_id, :created_at]
    
    add_foreign_key :comments, :entries
    add_foreign_key :comments, :users
  end
end
