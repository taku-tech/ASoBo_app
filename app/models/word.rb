class Word < ApplicationRecord
	# refile指定のカラムにアクセス
	attachment :image

	belongs_to :admin
	belongs_to :genre
	has_many :favorites, dependent: :destroy
	has_many :questions, dependent: :destroy
	has_many :choice_words, dependent: :destroy
	accepts_nested_attributes_for :choice_words


	def favorite_by?(user)
		favorites.where(user_id: user.id).exists?
	end
end
