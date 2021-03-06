class ReviewsController < ApplicationController
    #check if logged in
    before_action :check_login, except: [:index, :show]

    def index
    #this is the list page for the reviews
        @price = params[:price]
        @cuisine = params[:cuisine]
        @location = params[:location]
        @score_asc = params[:score_asc]
        @score_desc = params[:score_desc]
        # @reviews = Review.all 
        @reviews = Review.paginate(:page => params[:page], :per_page => 5)
        if @price.present?
            @reviews = @reviews.where(price: @price)
        end
        if @cuisine.present?
            @reviews = @reviews.where(cuisine: @cuisine)
        end
        if @location.present?
            @reviews = @reviews.near(@location)
        end
        if @score_asc.present?
            @reviews = @reviews.order(score: :asc)
        end
        if @score_desc.present?
            @reviews = @reviews.order(score: :desc)
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
        if @review.valid?
            @review.save
            flash[:success] = "Your review has been posted"
            redirect_to reviews_path
        else
            flash.now[:messages] = @review.errors.full_messages 
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
            flash[:success] = "Your review has been deleted"
            redirect_to reviews_path
        end
    #redirect to the homepage
    end 
    def edit
    #the form to update the post
        @review = Review.find(params[:id])
        if @review.user != @current_user
            redirect_to root_path
        elsif @review.created_at < 1.hour.ago
            redirect_to review_path(@review)
        end
    end
    def update 
    #saves the updated version in the database
        @review = Review.find(params[:id])
        if @review.user != @current_user
            redirect_to root_path
        else 
            if @review.update(form_params)
                flash[:success] = "Your review has been updated"
                redirect_to review_path(@review)
            else
                render "edit"
            end
        end
    end
    def form_params
        params.require(:review).permit(:title, :restaurant, :body, :score, :ambiance, :price, :cuisine, :address, :photo)
    end 
end
