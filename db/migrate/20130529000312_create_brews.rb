class CreateBrews < ActiveRecord::Migration
  def change
    create_table :brews do |t|
      t.string :bid
      t.string :name
      t.string :brewery
      t.string :med_image_url
      t.string :large_image_url

      t.timestamps
    end
  end
end
