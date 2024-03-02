class CreatorsController < ApplicationController
  def new
    @creator = Creator.new
  end

  def create
    @creator = Creator.new(creator_params)
    @creator.user = current_user
    if @creator.save!
      redirect_to root_path
    else
      render :new, status: unprocessable_entity
    end
  end

  def show
    @albums = Album.where(creator_id: params[:id])
  end

  private

  def creator_params
    params.permit(:name)
  end
end
