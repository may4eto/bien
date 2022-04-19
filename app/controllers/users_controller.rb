class UsersController < ApplicationController
    def index
        @users = User.all
    end
    def show 
        @user = User.find_by(username: params[:id])
    end
    def new
        @user = User.new
    end
    def create 
        @user = User.new(form_params)
        if @user.save
            #save the session with the user
            session[:user_id] = @user.id
            flash[:success] = "Welcome to Bien Reviews! Log in to write reviews"
            redirect_to new_session_path
        else
            render "new"
        end
    end
    def form_params
        params.require(:user).permit(:real_name, :username, :email, :password, :password_confirmation)
    end
end
