class Word < ApplicationRecord
	# refile指定のカラムにアクセス
	attachment :image

	belongs_to :admin
	belongs_to :genre
	has_many :choice_words, dependent: :destroy
	accepts_nested_attributes_for :choice_words
end
