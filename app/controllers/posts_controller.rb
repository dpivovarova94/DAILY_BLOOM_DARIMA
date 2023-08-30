class PostsController < ApplicationController
  layout 'show_layout', only: :show

  def index
    friend_ids = current_user.friendships.where(status: 'accepted').pluck(:friend_id)
    if params[:medium].present?
      if params[:medium] == "photo"
        # @posts = Post.joins(:challenge).where(challenges: { user_id: current_user.id }).joins(:photo_attachment).where.not(active_storage_attachments: { blob_id: nil }).order(created_at: :desc)
        @posts = Post.joins(:challenge)
                      .where("challenges.user_id = ? OR challenges.user_id IN (?)",
                          current_user.id,
                          friend_ids)
                      .joins(:photo_attachment).where.not(active_storage_attachments: { blob_id: nil }).order(created_at: :desc)
      else
        # @posts = Post.joins(:challenge).where(challenges: { user_id: current_user.id }).where.not(params[:medium] => "").order(created_at: :desc)
        @posts = Post.joins(:challenge)
                      .where("challenges.user_id = ? OR challenges.user_id IN (?)",
                      current_user.id,
                      friend_ids)
                      .where.not(params[:medium] => "").order(created_at: :desc)
      end
    else
      # @posts = Post.joins(:challenge).where(challenges: { user_id: current_user.id }).order(created_at: :desc)
      # selecting posts of the current user and the friends of the current user with status accepted
      @posts = Post.joins(:challenge)
                   .where("challenges.user_id = ? OR challenges.user_id IN (?)",
                          current_user.id,
                          friend_ids)
                   .order(created_at: :desc)
    end
  end

  def show
     # No navbar
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

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = 'Post deleted successfully.'
    redirect_to feed_path
  end

  private

  def post_params
    params.require(:post).permit(:medium, :poem, :text, :song_url, :photo)
  end

end
