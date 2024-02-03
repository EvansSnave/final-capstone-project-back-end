class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  VALID_EMAIL_REGEX = /\A(?!\.)(?!.*\.$)(?!.*\.\.)[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  devise :database_authenticatable, :registerable,
         :validatable, :jwt_authenticatable, jwt_revocation_strategy: self

  validates :name, presence: true
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX }
  has_many :reservations
  has_many :doctors
end
