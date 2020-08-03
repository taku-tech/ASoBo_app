class Admins::WordsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @words = current_admin.words.all
  end

  def new
    @word = current_admin.words.new
    @genres = current_admin.genres.where(is_valid: true)
    4.times {
      @word.choice_words.build
    }
  end

  def show
    @word = Word.find(params[:id])
    @choice_words = @word.choice_words.all
  end

  def create
    word = current_admin.words.new(word_params)
    word.genre_id = params[:word][:genre_id]
    word.save
    redirect_to admins_words_path
  end

  def edit
    @word = Word.find(params[:id])
    @genres = current_admin.genres.where(is_valid: true)
  end

  def update
    word = Word.find(params[:id])
    word.genre_id = params[:word][:genre_id]
    word.update(word_params)
    redirect_to admins_words_path
  end

  private

    def word_params
      params.require(:word).permit(:text_en, :text_jp, :image, :is_valid,
                     choice_words_attributes: [:id, :text_en])
    end
end
