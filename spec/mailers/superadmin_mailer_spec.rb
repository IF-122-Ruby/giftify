require "rails_helper"

RSpec.describe SuperadminMailer, type: :mailer do
  describe ".superadmin_notification" do
    let(:organization) { FactoryBot.create(:organization) }
    let(:mail) { described_class.superadmin_notification(organization) }
    let(:superadmin) { Organization.find(organization.id).user }

    it "renders the headers" do
      expect(mail.subject).to eq("New organization successfuly created")
      expect(mail.to).to eq([superadmin.email])
      expect(mail.from).to eq(['from@example.com'])
    end

    it "contains link to organization" do
      expect(mail.body.encoded).to match(admin_organization_url(organization).to_s)
    end
  end
end
