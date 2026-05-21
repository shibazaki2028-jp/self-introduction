class ArticlesController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_article, only: %i[edit update destroy]

  def index
    @articles = Article.order(created_at: :desc)
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to articles_path, notice: "記事を作成しました。"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @article.update(article_params)
      redirect_to articles_path, notice: "記事を更新しました。"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path, notice: "記事を削除しました。"
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :body)
  end
end
