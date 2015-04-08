class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :score
      t.integer :parent_id
      t.string :parent_type
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
