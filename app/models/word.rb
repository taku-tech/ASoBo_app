class Word < ApplicationRecord
	# refile指定のカラムにアクセス
	attachment :image

	belongs_to :admin
	belongs_to :genre
end
