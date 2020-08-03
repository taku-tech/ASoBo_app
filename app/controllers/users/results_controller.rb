class Users::ResultsController < ApplicationController
  before_action :authenticate_user!

  def index
    @results = current_user.results.all.order(id: "DESC")
  end

  def show
    result = current_user.results.find(params[:id])
    @result_words = result.result_words.all
    @correct_answers_cnt = 0
    @questions_cnt = 0
    @result_words.each do |result_word|
      @questions_cnt = @questions_cnt + 1
      if result_word.word.text_en == result_word.chose_text
        @correct_answers_cnt = @correct_answers_cnt + 1
      end
    end
  end
end
