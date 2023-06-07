class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      case @post.medium
      when 'photo'
        # Handle photo upload logic
      when 'poem'
        # Handle poem upload logic
      when 'text'
        # Handle text upload logic
      when 'song'
        # Handle song upload logic
      end
        # Redirect or render appropriate response
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:medium, :picture_url, :poem, :text, :song_url)
  end
end
