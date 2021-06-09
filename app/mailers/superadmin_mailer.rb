class SuperadminMailer < ApplicationMailer
  def superadmin_notification(organization)
    @organization = organization
    @superadmin = Organization.find(@organization.id).user

    mail(to: @superadmin.email, subject: 'New organization successfuly created')
  end
end
