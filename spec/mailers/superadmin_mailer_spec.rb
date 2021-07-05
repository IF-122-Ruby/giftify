require "rails_helper"

RSpec.describe SuperadminMailer, type: :mailer do
  let!(:superadmins_mails) { create_list(:user, 10, :superadmin).pluck(:email) }

  describe "send_mail_when_new_feedback_created" do
    let(:mail) { SuperadminMailer.send_mail_when_new_feedback_created(create(:feedback)) }

    describe 'superadmins exists' do
      it "renders the headers" do
        expect(mail.subject).to eq("Someone wrote new feedback!")
        expect(mail.to).to eq(superadmins_mails)
        expect(mail.from).to eq(["giftify@mail.com"])
      end

      it "renders the body" do
        expect(mail.body.encoded).to match("sent feedback")
      end
    end
  end

  describe "send_mail_when_new_organization_created" do
    let(:mail) { SuperadminMailer.send_mail_when_new_organization_created(create(:organization)) }

    describe 'superadmins exists' do
      it "renders the headers" do
        expect(mail.subject).to eq("Someone create new organization!")
        expect(mail.to).to eq(superadmins_mails)
        expect(mail.from).to eq(["giftify@mail.com"])
      end

      it "renders the body" do
        expect(mail.body.encoded).to match("was successfully created")
      end

      it 'sends an email' do
        expect { mail }.to change { ActionMailer::Base.deliveries.count }.by(1)
      end
    end
  end
end
