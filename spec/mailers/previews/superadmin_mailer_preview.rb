# Preview all emails at http://localhost:3000/rails/mailers/superadmin_mailer
class SuperadminMailerPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/superadmin_mailer/superadmin_notification
  def superadmin_notification
    SuperadminMailer.superadmin_notification(Organization.first)
  end
end
