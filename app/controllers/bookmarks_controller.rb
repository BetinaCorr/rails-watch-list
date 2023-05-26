class BookmarksController < ApplicationController

  before_action :set_list, only: [:new, :create]

  def new
    @bookmark = Bookmark.new
  end

  def create
    @movie = Movie.find(params[:bookmark][:movie_id])
    comment = params
    @bookmark = Bookmark.new(movie: @movie, list: @list, comment: params[:bookmark][:comment])

    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new, stauts: :unprocessable_entity
    end

  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy

    redirect_to list_path(@bookmark.list_id)
  end

  private

  def set_list
    @list = List.find(params[:list_id])
  end
end
