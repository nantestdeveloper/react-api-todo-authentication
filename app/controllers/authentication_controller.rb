class AuthenticationController < ApplicationController
 skip_before_action :authenticate_request

  def authenticate
   command = AuthenticateUser.call(params[:user][:email], params[:user][:password])
   if command.success?
     render json: { code: 200,user: command }
   else
     render json: { code: 404,error: command.errors }, status: :unauthorized
   end
 end

	def verifyToken
	 	token = JsonWebToken.decode(params[:token])
	 	if token
	 	 	begin
	 	 	  @user = User.find(token[:user_id]) 
	     render json: { user: @user }
	   rescue
	     render json: { error: "Invalid token" }, status: :unauthorized
	   end
	  end
	end

	def signup
		user = User.new(sign_up_param)
		
		if user.save
			render json: { code: 200,user: user }
		else
			render json: { code: 402, error: user.errors.full_messages }
		end
	end

	private
    def sign_up_param
      params.require(:user).permit(:name, :email,:password,:password_confirmation)
    end
end