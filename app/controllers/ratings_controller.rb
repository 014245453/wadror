class RatingsController < ApplicationController
  def new
    @rating = Rating.new
    @beers = Beer.all
  end

  def index
    @ratings = Rating.all
  end

  def create
    Rating.create params.require(:rating).permit(:score, :beer_id)
    rating.user = current_user
    rating.save
    redirect_to current_user
  end

  def destroy
    rating = Rating.find(params[:id])
    rating.delete
    redirect_to user_path(current_user)
  end

  def create
    @rating = Rating.new params.require(:rating).permit(:score, :beer_id)
    @rating.user = current_user
  
    if @rating.save
      redirect_to user_path current_user
    else
      @beers = Beer.all
      render :new
    end
  end 
end
