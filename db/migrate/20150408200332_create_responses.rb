class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|

      t.text :content
      t.integer :parent_id
      t.string :parent_type
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
