class EntriesController < ApplicationController
	before_action :logged_in_user, only: [:create, :destroy]
	before_action :correct_user,   only: :destroy

	def show
		    @entry = Entry.find(params[:id])
		    @user_id = @entry.user_id
		    @user = User.find_by(@user_id)
		    @comments = @entry.comments.paginate(page: params[:page])
	  	
		    @comment = @entry.comments.build if logged_in?	
  	end

  	def create
  		@entry = current_user.entries.build(entry_params)
	    if @entry.save
		    flash[:success] = "Entry created!"
		    redirect_to root_url
	    else
	    	@feed_items = []
	      	render 'static_pages/home'
	    end
  	end

  	def destroy
	    @entry.destroy
	    flash[:success] = "Entry deleted"
	    redirect_to request.referrer || root_url
  	end


  	private
  	
	def entry_params
      	params.require(:entry).permit(:content, :title)
    end

	def correct_user
	    @entry = current_user.entries.find_by(id: params[:id])
      	redirect_to root_url if @entry.nil?
    end
end
