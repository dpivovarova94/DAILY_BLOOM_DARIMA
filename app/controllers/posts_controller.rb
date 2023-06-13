class PostsController < ApplicationController
  layout 'show_layout', only: :show

  def index
    @posts = Post.joins(:challenge).where(challenges: { user_id: current_user.id }).order(created_at: :desc)
    # @posts = Post.all
    # @posts.challenges
    # @posts = @user.challenge
    # @task = Task.new(:user => @current_user)
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

  private

  def post_params
    params.require(:post).permit(:medium, :poem, :text, :song_url, :photo)
  end

end
