require "rails_helper"

RSpec.describe InviteMailer, type: :mailer do
  describe "send_mail_when_new_invite_created" do
    let(:mail) { InviteMailer.new_user_invite(create(:invite)) }

    describe 'renders views of invitation mail' do
      it "renders the headers" do
        expect(mail.body.encoded).to match("Invitation to Giftify organization")
      end
    end

  end
end