class Organization < ApplicationRecord
  validates :name, presence: true, uniqueness: true
end
