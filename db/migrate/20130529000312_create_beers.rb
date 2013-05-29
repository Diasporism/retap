class CreateBeers < ActiveRecord::Migration
  def change
    create_table :beers do |t|
      t.string :bid
      t.string :name

      t.timestamps
    end
  end
end
