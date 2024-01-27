class Doctor < ApplicationRecord
  belongs_to :user
  belongs_to :city
  has_one :detail, dependent: :destroy
  has_many :reservations

  accepts_nested_attributes_for :detail
end
