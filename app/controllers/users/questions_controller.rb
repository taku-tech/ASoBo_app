class Users::QuestionsController < ApplicationController

	def level
	end

	def show
		@question = current_user.questions.find(params[:id])
		@question_word = Word.find(@question.word_id)
		@choices = @question_word.choice_words.all.shuffle
		@result = current_user.results.create
		@result_word = ResultWord.new
	end

	def next
		question = current_user.questions.find(params[:id])
		question_word = Word.find(question.word_id)
		@result = Result.find(params[:result][:id].to_i)
		result_word = @result.result_words.new(result_word_params)
		result_word.word_id = question_word.id
		result_word.result_id = @result.id
		question.is_done = true
		question.save
		result_word.save
		@question = current_user.questions.find_by(is_done: false)
		if @question.nil?
			redirect_to result_path(params[:result][:id].to_i)
		else
			@question_word = Word.find(@question.word_id)
			@choices = @question_word.choice_words.all.shuffle
			@result_word = ResultWord.new
			render :show
		end
	end

	def create
		question_count_per_level = {
			easy: 2,
			normal: 3,
			hard: 4
		}
		params[:level]
		@words = Word.all.shuffle.take(question_count_per_level[params[:level].to_sym])
		@words.each do |word|
			question = current_user.questions.new
			question.word_id = word.id
			question.save
		end
		redirect_to question_path(current_user.questions.first)
	end

	private
		def result_word_params
			params.require(:result_word).permit(:chose_text)
		end

		def question_params
			params.require(:question).permit(:is_done)
		end
end
