class CreateModels < ActiveRecord::Migration
  def change
    create_table :models do |t|
      t.string :name
      t.string :slug
      t.references :organization

      t.timestamps null: false
    end
    add_index :models, :slug, unique: true
  end
end
