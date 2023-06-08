class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @challenge = Challenge.find(params[:challenge_id])
    @post = Post.new
  end

  def create
    @challenge = Challenge.find(params[:challenge_id])
    @post = Post.new(post_params)
    @post.challenge = @challenge
    raise
    if @post.save
      # case @post.medium
      # when 'photo'
      #   redirect_to new_challenge_post_path(@challenge)
      # when 'poem'
      #   #blabla
      # when 'quote'
      #   #blabla
      # when 'song'
      #   #blabla
      # end
      redirect_to feed_path
    else
      render :new, status: :unprocessable_entity
    end
    # raise
  end

  private

  def post_params
    params.require(:post).permit(:medium, :poem, :text, :song_url, :photo)
  end

end
