class ReviewsController < ApplicationController
    def index
    #this is the list page for the reviews
        @reviews = Review.all
    end
    def new
    #the form for adding a new review
        @review = Review.new
    end
    def create 
    #take info from the form and add it to the database
    @review = Review.new(form_params)
    #save to the database
    @review.save
    #redirect to homepage
    redirect_to root_path
    end 
    def show
    #individual review page
        @review = Review.find(params[:id])
    end
    def destroy 
    #find an individual review 
        @review = Review.find(params[:id])
    # destroy it
        @review.destroy
    #redirect to the homepage
        redirect_to root_path
    end 
    def edit
    #the form to update the post
        @review = Review.find(params[:id])
    end
    def update 
    #saves the updated version in the database
        @review = Review.find(params[:id])
        @review.update(form_params)
        redirect_to review_path(@review)
    end
    def form_params
        params.require(:review).permit(:title, :body, :score)
    end 

end
