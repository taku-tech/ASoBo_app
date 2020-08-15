class Users::ResultsController < ApplicationController
  before_action :authenticate_user!

  def index
    @results = current_user.results.all.order(id: "DESC")
  end

  def show
    @result = current_user.results.find(params[:id])
    @result_details = @result.result_details.all
  end
end
