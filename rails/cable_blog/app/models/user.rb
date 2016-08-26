class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  with_options dependent: :destroy do
    has_many :user_organizations
  end
  has_many :posts

  has_many :organizations, through: :user_organizations

  def choices_as_owner
    [email] + organizations.pluck(:name)
  end
end
