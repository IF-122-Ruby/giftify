FactoryBot.create_list(:user, 2)

User.all.each do |user|
  FactoryBot.create(:organization, user: user)
end

Organization.all.each do |organization|
  FactoryBot.create_list(:user, 10, organization: organization, password: '123456')
end

FactoryBot.create_list(:feedback, 30)

FactoryBot.create(:user, :superadmin, email: "team.giftify@gmail.com", password: "123giftify456")

