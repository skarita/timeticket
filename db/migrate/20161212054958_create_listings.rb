class CreateListings < ActiveRecord::Migration[5.0]
  def change
    create_table :listings do |t|
      t.string :name
      t.text :description
      t.integer :user_id
      t.text :image
      t.string :location
      t.string :category
      t.integer :price
      t.integer :length

      t.timestamps
    end
  end
end
