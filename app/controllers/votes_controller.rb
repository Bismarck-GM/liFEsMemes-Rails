class VotesController < ApplicationController
  before_action :require_login, only:[:create]

  def create
    if current_user.votes.exists?(article_id: params[:article_id])
      flash[:alert] = 'You have already voted for this article!'
    else
      current_user.voted_articles << Article.find(params[:article_id])
      flash[:notice] = 'Vote added successfully.'
    end
    redirect_back(fallback_location: root_path)
  end
end
