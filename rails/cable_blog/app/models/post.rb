class Post < ApplicationRecord
  belongs_to :user
  belongs_to :owner, polymorphic: true

  validates :title, presence: true
end
