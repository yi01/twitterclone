class TweetsController < ApplicationController
  def index
    @tweets = Tweet.order("created_at desc")
  end
  
  def new
    if params[:back]
      @tweet = Tweet.new(tweet_params)
    else
      @tweet = Tweet.new
    end
  end
  
  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.save
      redirect_to :root, notice: "投稿しました"
    else
      render 'new'
    end
  end
  
  def edit
    @tweet = Tweet.find(params[:id])
  end
  
  def update
    @tweet = Tweet.find(params[:id])
    if @tweet.update
      redirect_to :root, notice: "更新しました"
    else
      render 'edit'
    end

  end
  
  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy
    redirect_to :root, notice: "削除しました"
  end
  
  def confirm
    @tweet = Tweet.new(tweet_params)
  end
  
  private
  def tweet_params
    params.require(:tweet).permit(:content)
  end
  
end
