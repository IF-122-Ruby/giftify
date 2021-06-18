class Account::InvitesController < Account::AccountsController
  def index
    @invites = collection.includes(:sender).by_created_at
  end

  def new
    @invite = Invite.new
  end

  def create
    @invite = Invite.new(invite_params)
    @invite.organization = current_organization
    @invite.sender = current_user

    if @invite.save
      flash[:success] = 'Invite was successfully sent.'
      redirect_to account_invites_path
    else
      flash[:danger] = 'Failed to send an invite.'
      render :new
    end
  end

  def destroy
    @invite = resource
    if @invite.delete
      flash[:success] = 'Invitation successfully deleted.'
    else
      flash[:danger] = 'Failed to delete invitation.'
    end
    redirect_to account_invites_path
  end

  private

  def invite_params
    params.require(:invite).permit(:recipient_email)
  end

  def collection
    current_organization.invites
  end

  def resource
    collection.find(params[:id])
  end
end