class User < ApplicationRecord

  has_many :games, dependent: :delete_all

  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true
end
