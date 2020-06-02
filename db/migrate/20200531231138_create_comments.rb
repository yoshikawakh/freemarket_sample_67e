class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.integer :users_id
      t.integer :products_id
      t.text :text
      t.timestamps
    end
  end
end