class CreateUserOrganizations < ActiveRecord::Migration[5.0]
  def change
    create_table :user_organizations do |t|
      t.references :user, foreign_key: true, null: false
      t.references :organization, foreign_key: true, null: false

      t.timestamps
    end
    add_index :user_organizations, [:user_id, :organization_id], unique: true
  end
end
