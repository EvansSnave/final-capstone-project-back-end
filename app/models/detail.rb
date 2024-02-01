class Detail < ApplicationRecord
  belongs_to :doctor

  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :specialization, presence: true, length: { maximum: 70 }
  validates :studies, presence: true, length: { maximum: 150 }
end
