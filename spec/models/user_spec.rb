# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  avatar                 :string
#  birthday               :date
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  first_name             :string
#  last_name              :string
#  provider               :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  token                  :string
#  uid                    :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of :first_name }
    it { is_expected.to validate_presence_of :last_name }
  end

  describe 'Birth date validations' do
    it { should allow_value(100.years.ago).for(:birthday) }
    it { should_not allow_value(100.days.from_now).for(:birthday) }
  end

  describe 'Used point' do

    let(:frozen_time) { (Time.current).freeze }
    before { Timecop.travel(frozen_time) }
    after { Timecop.return }

    let(:organization) { create(:organization) }
    let(:user) { create(:user, organization: organization) }
    let(:receiver) { create(:user, :simple, organization: user.organization) }
    let!(:transaction_previous_month) { create(:transaction, receiver: receiver, sender: user, amount: 5, created_at: 1.month.ago ) }
    let!(:transaction_start_of_this_month) { create(:transaction, receiver: receiver, sender: user, amount: 4, created_at: frozen_time.beginning_of_month.beginning_of_day) }
    let!(:transaction_end_of_this_month) { create(:transaction, receiver: receiver, sender: user, amount: 6, created_at: frozen_time.end_of_month.end_of_day) }

    it 'return used points for month' do
      expect(user.used_points_for_month).to eq(10)
    end

    it 'return used points' do
      expect(user.used_points).to eq(15)
    end
  end

  describe "notification" do
    let(:user) { create(:user, :with_organization) }

    it "create new notification" do
      expect(user.own_notifications.first.message).to eq("Welcome to organization #{user.organization.name}")
    end
  end
 
  describe 'from_omniauth' do
    context 'with new user' do
      let(:auth) { OmniAuth::AuthHash.new(
        provider: 'google_oauth2',
        uid: '107474126175461691576',
        info: {
          email: 'giftify@gmail.com',
          first_name: 'Steve',
          last_name: 'Jobs'
        }
      )}

      it 'create new user with google' do
        expect(User.from_omniauth(auth)).to be_new_record 
        expect(User.from_omniauth(auth).provider).to eq('google_oauth2')
        expect(User.from_omniauth(auth).uid).to eq('107474126175461691576')
        expect(User.from_omniauth(auth).email).to eq('giftify@gmail.com')
        expect(User.from_omniauth(auth).first_name).to eq('Steve')
        expect(User.from_omniauth(auth).last_name).to eq('Jobs')
      end
    end

    context 'with existing user' do
      let!(:organization) { create(:organization) }
      let!(:user) { create(:user, organization: organization) }
      let!(:google_user) { create(:user, provider: 'google_oauth2',
        uid: '107474126175461691576', first_name: 'Steve',
        last_name: 'Jobs', email:'giftify@gmail.com') }
      let(:auth) { OmniAuth::AuthHash.new(
        provider: google_user.provider,
        uid: google_user.uid,
        info: {
          email: google_user.email,
          first_name: google_user.first_name,
          last_name: google_user.last_name
        }
      )}

      it 'return user with google' do
        expect(User.from_omniauth(auth)).to be_persisted
        expect(User.from_omniauth(auth).provider).to eq('google_oauth2')
        expect(User.from_omniauth(auth).uid).to eq('107474126175461691576')
        expect(User.from_omniauth(auth).email).to eq('giftify@gmail.com')
        expect(User.from_omniauth(auth).first_name).to eq('Steve')
        expect(User.from_omniauth(auth).last_name).to eq('Jobs')
      end
    end
  end
end
