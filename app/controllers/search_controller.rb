class SearchController < ApplicationController
  def search
    @text = params[:search][:text]
    @words = Word.where(['english LIKE ? OR japanese LIKE ?', '%'+@text+'%', '%'+@text+'%'])
  end
end
