class SuperadminMailer < ApplicationMailer
  default from: 'giftify@mail.com'

  def send_mail_when_new_feedback_created(feedback)
    @feedback = feedback

    emails = superadmins_emails_list

    return if emails.empty?

    mail(to: emails, subject: 'Someone wrote new feedback!')
  end

  def send_mail_when_new_organization_created(organization)
    @organization = organization

    emails = superadmins_emails_list

    return if emails.empty?

    mail(to: emails, subject: 'Someone create new organization!')
  end

  private

  def superadmins_emails_list
    User.superadmins.pluck(:email)
  end
end
