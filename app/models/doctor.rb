class Doctor < ApplicationRecord
  belongs_to :user
  belongs_to :city
  belongs_to :detail
  has_many :reservations
end
