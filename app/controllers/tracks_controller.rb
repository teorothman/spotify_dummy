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
end
