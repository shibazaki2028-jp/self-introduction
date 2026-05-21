class DiaryEntriesController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_diary_entry, only: %i[edit update destroy]

  def index
    @diary_entries = DiaryEntry.order(entry_date: :desc, created_at: :desc)
  end

  def new
    @diary_entry = DiaryEntry.new(entry_date: Date.current)
  end

  def create
    @diary_entry = DiaryEntry.new(diary_entry_params)

    if @diary_entry.save
      redirect_to diary_entries_path, notice: "日記を追加しました。"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @diary_entry.update(diary_entry_params)
      redirect_to diary_entries_path, notice: "日記を更新しました。"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @diary_entry.destroy
    redirect_to diary_entries_path, notice: "日記を削除しました。"
  end

  private

  def set_diary_entry
    @diary_entry = DiaryEntry.find(params[:id])
  end

  def diary_entry_params
    params.require(:diary_entry).permit(:body, :entry_date, :image, :image_alt)
  end
end
