class ReviewsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]
  
  
  def index
    @item = Item.find(params[:item_id])
    @reviews = @item.reviews.all.page(params[:page])
  end
  
  def new
    @item = Item.find(params[:item_id])
    @review = @item.reviews.new
  end

  def create
    @item = Item.find(params[:item_id])
    @review = @item.reviews.new(review_params)
    @review.user_id = current_user.id
    if @review.save
      flash[:success] = 'レビュー が正常に投稿されました'
      redirect_to item_reviews_path
    else
      flash.now[:danger] = 'レビュー が投稿されませんでした'
      render :new
    end
  end

  def destroy
    @review.destroy
    flash[:success] = 'レビューを削除しました。'
    redirect_back(fallback_location: root_url)
  end

  private
  
  def set_review
    @item = Item.find(params[:item_id])
    @review = @item.reviews.find(params[:id])
  end
  # Strong Parameter
  def review_params
    params.require(:review).permit(:content)
  end
  
  def correct_user
    @review = current_user.reviews.find_by(id: params[:id])
    unless @review
      redirect_to root_path
    end
  end
end