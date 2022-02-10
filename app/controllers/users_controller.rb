class UsersController < ApplicationController
    skip_before_action :authorized, only: [:create]

    def profile 
        @token = encode_token({ user_id: current_user.id })
        render json: { user: UserSerializer.new(current_user), jwt: @token }, status: :accepted
    end   

    def index 
        render json: User.all
    end

    def create
        @user = User.create(user_params)

        if @user.valid?
            @token = encode_token({ user_id: @user.id })
            render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
        else 
            render json: { error: 'Failed to create user.' }
        end 
    end 

    private

        def user_params
            params.require(:user).permit(:username, :password, :firstname, :lastname)
        end 
end

end
