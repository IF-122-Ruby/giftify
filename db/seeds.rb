FactoryBot.create_list(:user, 2)

User.all.each do |user|
  FactoryBot.create(:organization, user: user)
end

Organization.all.each do |organization|
  FactoryBot.create_list(:user, 10, organization: organization, password: '123456')
end

FactoryBot.create_list(:feedback, 10)

