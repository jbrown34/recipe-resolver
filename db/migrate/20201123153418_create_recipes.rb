class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.integer :minutes
      t.integer :contributor_id
      t.string :tags
      t.string :nutrition
      t.string :name
      t.integer :n_steps
      t.string :description
      t.string :steps
      t.string :ingredients
      t.string :n_ingredients

      t.timestamps
    end
  end
end
