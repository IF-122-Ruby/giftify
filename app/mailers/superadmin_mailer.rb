class SuperadminMailer < ApplicationMailer
  default from: 'giftify@mail.com'

  def send_mail_when_new_feedback_created(feedback)
    @feedback = feedback

    mail(to: superadmins_emails_list, subject: 'Someone wrote new feedback!')
  end

  def send_mail_when_new_organization_created(organization)
    @organization = organization

    mail(to: superadmins_emails_list, subject: 'Someone create new organization!')
  end

  private

  def superadmins_emails_list
    User.superadmins.pluck(:email)
  end
end
