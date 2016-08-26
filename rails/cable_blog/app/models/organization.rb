class Organization < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  with_options dependent: :destroy do
    has_many :user_organizations
  end
  has_many :users, through: :user_organizations
end
