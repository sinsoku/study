class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.references :user, foreign_key: true, null: false
      t.references :owner, polymorphic: true, null: false
      t.string :title, null: false
      t.text :body, default: ''

      t.timestamps
    end
  end
end
