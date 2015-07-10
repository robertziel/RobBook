class PostsController < ApplicationController
  def index
	@post = Post.all
	@post_new = Post.new 
	@comment = Comment.all
	@comment_new = Comment.new 
  end

  def create 
    @post_new = current_user.posts.build(post_params)
    if @post_new.content == ""
      redirect_to '/' 
    elsif @post_new.save 
      redirect_to '/' 
    else 
      render '/' 
    end 
  end



  private 
    def post_params 
    	params.require(:post).permit(:content) 
    end

before_action :require_user, only: [:index, :show]
end
