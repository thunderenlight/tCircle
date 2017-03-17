class CommentsController < ApplicationController
  

  def create
  	@interest = Interest.find(params[:interest_id])
  	cparams = comment_params
  	cparams["user_id"] = current_user.id
  	@comment = @interest.comments.create!(cparams)
  	redirect_to interest_path(@interest)
	 # if @comment.save
	 #        format.html { redirect_to interests_path, notice: 'Comment created!' }
	 #        format.json { render :show, status: :created, location: @comment }
	 #    else
	 #        format.html { render :new }
	 #        format.json { render json: @interest.errors, status: :unprocessable_entity }
	 # end
  end


  private

   def comment_params
   	params.require(:comment).permit(:body)
   end
end
