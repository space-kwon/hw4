class User < ApplicationRecord
  has_secure_password
  has_many :places
  has_many :entries
  validates :email, presence: true, uniqueness: true
end
