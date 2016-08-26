class CreateUserOrganizations < ActiveRecord::Migration[5.0]
  def change
    create_table :user_organizations do |t|
      t.references :user, foreign_key: true
      t.references :organization, foreign_key: true

      t.timestamps
    end
  end
end
