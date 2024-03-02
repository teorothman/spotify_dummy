class TracksController < ApplicationController
  def index
    if params[:query].present?

      track_search_results = Track.super_search(params[:query])

      albums_by_creator = Album.search_by_creator(params[:query])
      tracks_by_creator = Track.where(album: albums_by_creator)

      @tracks = (track_search_results + tracks_by_creator).uniq
    else
      @tracks = Track.all
    end
  end

  def new
    @track = Track.new
  end

  def create
    @track = Track.new(track_params)
    if @track.save!
      redirect_to user_creator_path(params[:user_id], params[:creator_id])
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def track_params
    params.require(:track).permit(:name, :genre_id, :album_id)
  end
end
