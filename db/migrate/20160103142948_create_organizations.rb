class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string :name
      t.string :public_name
      t.string :org_type
      t.string :pricing_policy

      t.timestamps null: false
    end
  end
end
