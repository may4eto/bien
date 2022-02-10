class ReviewsController < ApplicationController
    #check if logged in
    before_action :check_login, except: [:index, :show]

    def index
    #this is the list page for the reviews
        @price = params[:price]
        @cuisine = params[:cuisine]
        @location = params[:location]
        @reviews = Review.all 
        if @price.present?
            @reviews = @reviews.where(price: @price)
        end
        if @cuisine.present?
            @reviews = @reviews.where(cuisine: @cuisine)
        end
        if @location.present?
            @reviews = @reviews.near(@location)
        end
    end
    def new
    #the form for adding a new review
        @review = Review.new
        @min_length = Review.validators_on( :body ).first.options[:minimum]
    end
    def create 
    #take info from the form and add it to the model
    @review = Review.new(form_params)
    #then associate it to the current user
    @review.user = @current_user
    # we want to check  if the model can be saved 
        if @review.save
            redirect_to root_path
        else
            render "new"
        end
    end 
    def show
    #individual review page
        @review = Review.find(params[:id])
    end
    def destroy 
    #find an individual review 
        @review = Review.find(params[:id])
    # destroy it
        if @review.user = @current_user
            @review.destroy
        end
    #redirect to the homepage
        redirect_to root_path
    end 
    def edit
    #the form to update the post
        @review = Review.find(params[:id])
        if @review.user != @current_user
            redirect_to root_path
        end
    end
    def update 
    #saves the updated version in the database
        @review = Review.find(params[:id])
        if @review.user != @current_user
            redirect_to root_path
        else 
            if @review.update(form_params)
                redirect_to review_path(@review)
            else
                render "edit"
            end
        end
    end
    def form_params
        params.require(:review).permit(:title, :restaurant, :body, :score, :ambiance, :price, :cuisine, :address)
    end 

end
