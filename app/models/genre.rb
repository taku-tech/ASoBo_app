class Genre < ApplicationRecord
  has_many :words

  validates :name, presence: true, length: {maximum: 50}
end
