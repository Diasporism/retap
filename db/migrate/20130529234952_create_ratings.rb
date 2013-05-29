class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.references :user
      t.references :brew
      t.boolean :rating

      t.timestamps
    end
    add_index :ratings, :user_id
    add_index :ratings, :brew_id
  end
end
