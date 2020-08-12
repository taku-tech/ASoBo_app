class Result < ApplicationRecord
  belongs_to :user
  has_many :result_details, dependent: :destroy
end
