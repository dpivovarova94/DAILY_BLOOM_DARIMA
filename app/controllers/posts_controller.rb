class PostsController < ApplicationController
  def index
    if params[:medium].present?
      if params[:medium] == "photo"
        @posts = Post.joins(:challenge).where(challenges: { user_id: current_user.id }).joins(:photo_attachment).where.not(active_storage_attachments: { blob_id: nil }).order(created_at: :desc)
      else
        @posts = Post.joins(:challenge).where(challenges: { user_id: current_user.id }).where.not(params[:medium] => "").order(created_at: :desc)
      end
    else
      @posts = Post.joins(:challenge).where(challenges: { user_id: current_user.id }).order(created_at: :desc)
    end
  end

  def show
    @post = Post.find(params[:id])
    @challenge = @post.challenge
    @keyword = @challenge.keyword
  end

  def new
    @challenge = Challenge.find(params[:challenge_id])
    @post = Post.new
  end

  def create
    @challenge = Challenge.find(params[:challenge_id])
    @post = Post.new(post_params)
    @post.challenge = @challenge
    if @post.save

      redirect_to feed_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.require(:post).permit(:medium, :poem, :text, :song_url, :photo)
  end

end
