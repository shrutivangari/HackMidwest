class SuggestionsController < ApplicationController
  def index
    email = suggestions_params[:email]
    diseases = suggestions_params[:conditions]
    food = suggestions_params[:foods]

    if is_in_db? food

    end

    respond_to do |format|
      format.json { render json: suggestions_params}
      format.html { render :index }
    end
  end

  def is_in_db? food
    list_in_db = Food.where(:name => food)
  end

  private
  def suggestions_params
    params.permit(:email, :conditions, :foods)
  end
end
