class ArtistEntriesController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_artist_entry, only: %i[edit update destroy]

  def index
    @artist_entries = ArtistEntry.ordered
  end

  def new
    @artist_entry = ArtistEntry.new(position: next_position)
  end

  def create
    @artist_entry = ArtistEntry.new(artist_entry_params)

    if @artist_entry.save
      redirect_to artist_entries_path, notice: "アーティストを追加しました。"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @artist_entry.update(artist_entry_params)
      redirect_to artist_entries_path, notice: "アーティストを更新しました。"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @artist_entry.destroy
    redirect_to artist_entries_path, notice: "アーティストを削除しました。"
  end

  private

  def set_artist_entry
    @artist_entry = ArtistEntry.find(params[:id])
  end

  def artist_entry_params
    params.require(:artist_entry).permit(:name, :body, :position)
  end

  def next_position
    (ArtistEntry.maximum(:position) || 0) + 1
  end
end
