class Admins::WordsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @words = Word.all
  end

  def new
    @word = Word.new
    @genres = Genre.where(is_valid: true)
    4.times {
      @word.choices.build
    }
  end

  def show
    @word = Word.find(params[:id])
    @choices = @word.choices.all
  end

  def create
    @word = Word.new(word_params)
    @word.genre_id = params[:word][:genre_id]
    if @word.save
      redirect_to admins_words_path
    else
      @genres = Genre.where(is_valid: true)
      render :new
    end
  end

  def edit
    @word = Word.find(params[:id])
    @genres = Genre.where(is_valid: true)
  end

  def update
    word = Word.find(params[:id])
    word.genre_id = params[:word][:genre_id]
    if word.update(word_params)
      redirect_to admins_words_path
    else
      @genres = Genre.where(is_valid: true)
      render :edit
    end
  end

  private

    def word_params
      params.require(:word).permit(:english, :japanese, :image, :is_valid,
                                    choices_attributes: [:id, :content])
    end

end
