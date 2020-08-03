class Users::FavoritesController < ApplicationController
  before_action :authenticate_user!

  def index
    @favorites = current_user.favorites.all
  end

  def create
    @word = Word.find(params[:word_id])
    favorite = current_user.favorites.new(word_id: @word.id)
    favorite.save
  end

  def destroy
    @word = Word.find(params[:word_id])
    favorite = current_user.favorites.find_by(word_id: @word.id)
    favorite.destroy
  end
end
