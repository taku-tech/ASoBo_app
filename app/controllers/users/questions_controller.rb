class Users::QuestionsController < ApplicationController
  before_action :authenticate_user!

  def level
  end

  def show
    @question = current_user.questions.find(params[:id])
    @question_word = Word.find(@question.word_id)
    @choices = @question_word.choices.all.shuffle
    @result = current_user.results.new
    @result.level = session[:level]
    @result.save
    session[:level].clear
    @result_word = ResultDetail.new
  end

  def next
    # 回答された問題
    question = current_user.questions.find(params[:id])
    question_word = Word.find(question.word_id)
    question.is_done = true
    question.save
    # 直前の問題を結果テーブルに保存する
    @result = Result.find(params[:result][:id].to_i)
    result_word = @result.result_details.new(result_detail_params)
    result_word.word_id = question_word.id
    result_word.result_id = @result.id
    result_word.save

    @question = current_user.questions.find_by(is_done: false)
    if @question.nil?
      current_user.questions.destroy_all
      # 正解数の判定と保存
      @result_details = @result.result_details.all
      correct_answers_cnt = 0
      @result_details.each do |result_detail|
        if result_detail.word.english == result_detail.selected_choice
          correct_answers_cnt = correct_answers_cnt + 1
        end
      end
      @result.score = correct_answers_cnt
      @result.save

      redirect_to result_path(params[:result][:id].to_i)
    else
      @question_word = Word.find(@question.word_id)
      @choices = @question_word.choices.all.shuffle
      @result_word = ResultDetail.new
      render :show
    end
  end

  def create
    question_count_per_level = {
      easy: 5,
      normal: 10,
      hard: 15
    } # 難易度ごとに問題の表示数を指定
    session[:level] = params[:level]
    @words = Word.all.shuffle.take(question_count_per_level[params[:level].to_sym]) # ランダムで単語をピックアップ
    # 問題を作成
    @words.each do |word|
      question = current_user.questions.new
      question.word_id = word.id
      question.save
    end
    redirect_to question_path(current_user.questions.first)
  end

  private
    def result_detail_params
      params.require(:result_detail).permit(:selected_choice)
    end

    def question_params
      params.require(:question).permit(:is_done)
    end
end
