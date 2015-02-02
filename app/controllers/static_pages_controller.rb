class StaticPagesController < ApplicationController
  	def home
  	    if logged_in?
	      	@entry  = current_user.entries.build
	      	@user = current_user
	      	@feed_items = current_user.feed.paginate(page: params[:page])
    	else
    		@entry = Entry.all
    		@feed_items = @entry.paginate(page: params[:page])
    	end
  	end
end
