class UsersController < ApplicationController
    def index
        if @current_user.present? and @current_user.is_admin?
            @users = User.all
        else 
            redirect_to root_path
        end
    end
    def show 
        @user = User.find_by(username: params[:id])
    end
    def new
        @user = User.new
    end
    def create 
        @user = User.new(form_params)
        if @user.valid?
            #save the session with the user
            @user.save
            session[:user_id] = @user.id
            flash[:success] = "Welcome to Bien Reviews! Log in to write reviews"
            redirect_to new_session_path
        else
            flash.now[:messages] = @user.errors.full_messages 
            render "new"
        end
    end
    def form_params
        params.require(:user).permit(:real_name, :username, :email, :password, :password_confirmation)
    end
end
