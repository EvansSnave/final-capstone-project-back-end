class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :validatable, :jwt_authenticatable, jwt_revocation_strategy: self
  validates :name, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 80 }
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  has_many :reservations
  has_many :doctors
end
