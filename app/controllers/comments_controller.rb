class CommentsController < ApplicationController
	 before_action :authenticate_user!
	def create
		@place = Place.find(params[:place_id])
	    #@place.comments.create(comment_params.merge(:user_id => current_user))
	    @comment = @place.comments.build(comment_params)
	    @comment.user = current_user
	    @comment.save 
	    redirect_to @place
	end

	 private

	def comment_params
		params.require(:comment).permit(:message, :rating)
	end

end
