class AlbumsController < ApplicationController
  def new
    @album = Album.new
  end

  def create
    @album = Album.new(album_params)
    if @album.save!
      redirect_to user_creator_path(params[:user_id], params[:creator_id])
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def album_params
    album_attributes = params.require(:album).permit(:name, :description)
    album_attributes[:creator_id] = params[:creator_id] if params[:creator_id].present?
    album_attributes
  end
end
