class Result < ApplicationRecord
  belongs_to :user
  has_many :result_words, dependent: :destroy
end
