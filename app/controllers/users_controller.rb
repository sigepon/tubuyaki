class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        user = User.new(user_params)
        if user.save
            redirect_to root_path, notice: 'ユーザを作成しました'
        else
            render new_user_path, alert: 'ユーザー登録に失敗しました'
        end
    end

    private

    def user_params
        params.require(:user).permit(:name, :email, :password, :icon)
    end
end
