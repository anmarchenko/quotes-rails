class Quote < ApplicationRecord
  validates :name, presence: true

  scope :order_newest, -> { order(id: :desc) }
end
