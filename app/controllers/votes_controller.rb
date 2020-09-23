class VotesController < ApplicationController
  before_action :require_login, only: %i[create destroy]

  def create
    if current_user.votes.exists?(article_id: params[:article_id])
      flash[:alert] = 'You have already voted for this article!'
    else
      current_user.voted_articles << Article.find(params[:article_id])
      flash[:notice] = 'Vote added successfully.'
    end
    redirect_back(fallback_location: root_path)
  end

  def destroy
    vote = Vote.find_by(article_id: params[:article_id], user_id: current_user.id)
    if vote
      vote.destroy
      flash[:alert] = 'You have deleted your vote!'
    else
      flash[:alert] = 'You have already voted for this article!'
    end
    redirect_back(fallback_location: root_path)
  end
end
