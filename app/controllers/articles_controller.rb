class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :destory, :edit, :update]

  def index
    @articles = Article.all
  end

  def show
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.save

  flash.notice = "Your article has been created!"

    redirect_to article_path(@article)
  end

  def edit
  end

  def update
    @article.update(article_params)

    flash.notice = "Your article has been updated!"

    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.destroy(params[:id])

    flash.notice = "Your article has been deleted!"

    redirect_to articles_path
  end

private
  def article_params
    params.require(:article).permit(:title, :body)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
