class PagesController < ApplicationController
  def fav_artist
    @artist_entries = ArtistEntry.ordered
  end

  def diary
    @diary_entries = DiaryEntry.order(entry_date: :desc, created_at: :desc)
  end

  def my_history
  end

  def secret
  end

  def update_content
    @update_log_entries = UpdateLogEntry.order(log_date: :desc, created_at: :desc)
  end
end
