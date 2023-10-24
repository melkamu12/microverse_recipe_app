class RenameRecipesToRecipe < ActiveRecord::Migration[7.1]
  def change
    rename_table :recipes, :recipe
  end
end
