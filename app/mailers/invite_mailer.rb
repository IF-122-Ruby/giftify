class InviteMailer < ApplicationMailer
  def new_user_invite(invite)
    @invite = invite
    mail(to: invite.recipient_email, subject: "Invite")
  end
end