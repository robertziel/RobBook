class PostsController < ApplicationController
  def index
	@list_of_friendships = current_user.friendships.all + current_user.inverse_friendships.all if current_user
	@list_of_friendships.delete_if{|x| x.confirmed == 0} if current_user
	@list_of_friendships.each{|x| x.friend = x.user if x.friend == current_user} if current_user
	@post = Post.where(:user_id => current_user.id)
	for x in @list_of_friendships
		@post = @post + Post.where(:user_id => x.friend)
	end
	@post_new = Post.new 
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
