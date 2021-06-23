class AcceptInvitesController < ApplicationController
  layout 'devise'
  def new
    @token = params[:token] 
    @user = User.new  
  end
  
  def create
    @token = params[:user][:token]
    @user = User.new(acception_params)

    invite = Invite.find_by!(invite_token: @token)

    @user.organization = invite.organization
    @user.email = invite.recipient_email
    
    if @user.save
      flash[:success] = 'Successfully signed up'
      redirect_to account_users_path
    else
      flash[:danger] = 'Something went wrong'
      render action: :new
    end
  end

  private

  def acception_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :password,
      :password_confirmation,
    )   
  end
end
