class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        user = User.new(user_params)
        user.save
        redirect_to root_path
    end

    def edit
       @post = Post.find(params[:id])
    end

    def update
        @post = Post.find(params[:id])
        @post.update(post_params)
        # redirect_to root_path
        redirect_to "/posts/#{@post.id}"
    end

    def signin
        login(params[:email], params[:password])
        redirect_to root_path
    end

    def signout
        logout
        redirect_to root_path
    end

    private

    def user_params
        params.require(:user).permit(:name, :email, :password, :icon)
    end
end
