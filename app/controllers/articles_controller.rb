class ArticlesController < ApplicationController
  def index

  end

  def new
    @categories = Category.all
    @article = Article.new
  end
end
