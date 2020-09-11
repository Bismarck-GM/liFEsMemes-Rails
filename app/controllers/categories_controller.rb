class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    @articles = Category.category_articles(@category)
  end
end 
