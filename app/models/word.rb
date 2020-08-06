class Word < ApplicationRecord
	# refile指定のカラムにアクセス
	attachment :image

	belongs_to :genre

	has_many :favorites, dependent: :destroy
	has_many :questions, dependent: :destroy
	has_many :result_details, dependent: :destroy
	has_many :choices, dependent: :destroy

	accepts_nested_attributes_for :choices

	def favorite_by?(user)
		favorites.where(user_id: user.id).exists?
	end
end
