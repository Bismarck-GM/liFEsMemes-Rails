class ArticlesController < ApplicationController
  before_action :require_login, only:[:new]
  def index

  end

  def new
    @article = Article.new
    @categories = Category.all
  end

  def create
    @article = current_user.articles.new(article_params)
  end

  
  private

  def article_params
    params.require(:article).permit(:title, :text, :image, :categories)
  end
end
