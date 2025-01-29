class CreateRecipes < ActiveRecord::Migration[8.0]
  def change
    create_table :recipes do |t|
      t.string :title
      t.integer :prep_time
      t.integer :servings
      t.string :description
      t.string :ingredients
      t.string :directions
      t.string :chef
      t.string :image_url

      t.timestamps
    end
  end
end
