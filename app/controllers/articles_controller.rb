class ArticlesController < ApplicationController
  before_action :require_login, only:[:new]
  before_action :set_categories, only: [:new]

  def index
    @article = Article.first
    @categories = Category.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = current_user.articles.build(article_params)
    if @article.save
      flash[:notice] = ['Meme created successfully.']
      redirect_to root_path
    else
      flash[:notice] = @article.errors.full_messages
      redirect_back(fallback_location:new_article_path)
    end
  end

  
  private

  def article_params
    params.require(:article).permit(:title, :text, :image, category_ids: [])
  end

  def set_categories
    @categories = Category.pluck('name', 'id')
  end
end
