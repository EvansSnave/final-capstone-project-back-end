class Doctor < ApplicationRecord
  belongs_to :user
  belongs_to :city
  has_one :detail, dependent: :destroy
  has_many :reservations, dependent: :destroy
  has_one_attached :avatar

  validates :city_id, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :user_id, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :name, presence: true, length: { maximum: 70 }
  validates :description, presence: true, length: { maximum: 800 }
  validates :image_url, presence: true, length: { maximum: 300 }
  validates :age, presence: true, numericality: { only_integer: true, greater_than: 17 }

  accepts_nested_attributes_for :detail

  def avatar_url
    Rails.application.routes.url_helpers.url_for(avatar) if avatar.attached?
  end
end
