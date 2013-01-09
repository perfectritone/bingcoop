class SuggestionsController < ApplicationController
  before_filter :admin_user, only: [:index, :show]
  
  def create
    @suggestion = Suggestion.new(params[:suggestion])
    if @suggestion.save
      flash[:success] = "You've successfully submitted your suggestion. Thanks for letting us know what you think!"
    else
      flash[:error] = "Sorry, there was a problem submitting your suggestion. Please e-mail us at foodcoop@binghamtonsa.org"
    end
    redirect_to get_involved_path
  end
  
  def index
    @suggestions = Suggestion.all
  end
  
  def show
    @suggestion = Suggestion.find(params[:id])
  end

  private
  
    def admin_user
      redirect_to(root_path) unless current_user.admin?
    rescue
      redirect_to(root_path)
    end
end
