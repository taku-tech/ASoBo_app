class SearchController < ApplicationController
  def search
    @text = params[:search][:text]
    @words = Word.where(['text_en LIKE ? OR text_jp LIKE ?', '%'+@text+'%', '%'+@text+'%'])
  end
end
