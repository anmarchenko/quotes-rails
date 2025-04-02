class Client < ApplicationRecord
  has_many :quotes

  validates :name, presence: true, uniqueness: true
end
