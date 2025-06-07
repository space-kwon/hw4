class EntriesController < ApplicationController
  before_action :require_login

  def new
    @place = current_user.places.find(params[:place_id])
    @entry = @place.entries.build
  end

  def create
    @place = current_user.places.find(params[:place_id])
    @entry = @place.entries.build(entry_params)
    @entry.user = current_user
    if @entry.save
      redirect_to place_path(@place)
    else
      render :new
    end
  end

  private
  def entry_params
    params.require(:entry).permit(:title, :description, :occurred_on, :image)
  end
end
