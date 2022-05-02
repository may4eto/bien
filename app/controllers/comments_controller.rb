class CommentsController < ApplicationController
    def create 
        @review = Review.find(params[:review_id])
        @comment = @review.comments.new(params.require(:comment).permit(:body))
        @comment.user = @current_user
        @comment.save 
        flash[:success] = "Your comment has been posted"
        redirect_to review_path(@review)
    end
    # def edit
    #     @review = Review.find(params[:review_id])
    #     @comment = @review.comments.find(params[:id])
    # end
    
    def update
        @review = Review.find(params[:review_id])
        @comment = @review.comments.find(params[:id])
        respond_to do |format|
            if @comment.update(comment_params)
                format.html { redirect_to review.url(@review) }
                flash[:success] = "Your comment has been updated"
            else 
                format.html { redirect_to review.url(@review) }
                flash[:error] = "Something went wrong. Please try again"
            end
        end
    end

    def destroy
        #find an individual comment
        @review = Review.find(params[:review_id])
        @comment = @review.comments.find(params[:id])
    # destroy it
        if @comment.user = @current_user
            @comment.destroy
        end
        flash[:success] = "Your comment has been deleted"
        redirect_to review_path(@review)
    end
end
