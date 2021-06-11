# Preview all emails at http://localhost:3000/rails/mailers/superadmin_mailer
class SuperadminMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/superadmin_mailer/send_mail_when_new_feedback_created
  def send_mail_when_new_feedback_created
    SuperadminMailer.send_mail_when_new_feedback_created
  end

end
