class Post < ApplicationRecord
  belongs_to :user
  belongs_to :owner, polymorphic: true

  validates :title, presence: true

  attr_accessor :owner_as

  before_validation :set_owner, if: :owner_as

  private

  def set_owner
    self.owner = if user.email == owner_as
                   user
                 else
                   user.organizations.find_by!(name: owner_as)
                 end
  end
end
