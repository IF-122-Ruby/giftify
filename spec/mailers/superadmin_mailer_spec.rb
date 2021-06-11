require "rails_helper"

RSpec.describe SuperadminMailer, type: :mailer do
  describe "send_mail_when_new_feedback_created" do
    let(:mail) { SuperadminMailer.send_mail_when_new_feedback_created(create(:feedback)) }
    
    
    describe 'superadmins exists' do
      let!(:superadmins) { create_list(:user, 10, :superadmin) }

      it "renders the headers" do
        expect(mail.subject).to eq("Someone wrote new feedback!")
        expect(mail.to).to eq(superadmins.pluck(:email))
        expect(mail.from).to eq(["giftify@mail.com"])
      end

      it "renders the body" do
        expect(mail.body.encoded).to match("sent feedback")
      end
    end
  end
end