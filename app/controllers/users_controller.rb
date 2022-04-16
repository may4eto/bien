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
            redirect_to root_path
        else
            render "new"
        end
    end
    def form_params
        params.require(:user).permit(:real_name, :username, :email, :password, :password_confirmation)
    end
end
