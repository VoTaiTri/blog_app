class CommentsController < ApplicationController
	before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

	def create
		#@entry = Entry.find(params[:id])
		#@comment = @entry.comments.build(comment_params)
    byebug
		@commnent = Comment.new(comment_params)
    	if @commnent.save
      		flash[:success] = "Comment created!"
      		redirect_to request.referrer || root_url
    	else
    		flash[:danger] = "Comment fails. Please try again!"
      		redirect_to request.referrer
    	end
	end

	def destroy
		@comment.destroy
    	flash[:success] = "Your comment deleted"
    	redirect_to request.referrer || root_url
	end

	private
  	
		def comment_params
		    params.require(:comment).permit(:content, :entry_id, :user_id)
		end

		def correct_user
	      	@comment = current_user.comments.find_by(id: params[:id])
	      	redirect_to root_url if @comment.nil?
    	end
end
