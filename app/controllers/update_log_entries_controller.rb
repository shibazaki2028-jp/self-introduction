class UpdateLogEntriesController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_update_log_entry, only: %i[edit update destroy]

  def index
    @update_log_entries = UpdateLogEntry.order(log_date: :desc, created_at: :desc)
  end

  def new
    @update_log_entry = UpdateLogEntry.new(log_date: Date.current)
  end

  def create
    @update_log_entry = UpdateLogEntry.new(update_log_entry_params)

    if @update_log_entry.save
      redirect_to update_log_entries_path, notice: "追加ログを作成しました。"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @update_log_entry.update(update_log_entry_params)
      redirect_to update_log_entries_path, notice: "追加ログを更新しました。"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @update_log_entry.destroy
    redirect_to update_log_entries_path, notice: "追加ログを削除しました。"
  end

  private

  def set_update_log_entry
    @update_log_entry = UpdateLogEntry.find(params[:id])
  end

  def update_log_entry_params
    params.require(:update_log_entry).permit(:log_date, :title, :body)
  end
end
