class Users::ResultsController < ApplicationController
  before_action :authenticate_user!

  def index
    @results = current_user.results.all.order(id: "DESC")
  end

  def show
    result = current_user.results.find(params[:id])
    @result_details = result.result_details.all
    @correct_answers_cnt = 0
    @questions_cnt = 0
    @result_details.each do |result_detail|
      @questions_cnt = @questions_cnt + 1
      if result_detail.word.english == result_detail.selected_choice
        @correct_answers_cnt = @correct_answers_cnt + 1
      end
    end
  end
end
