FactoryBot.create_list(:user, 2, :with_organization)

User.all.each do |user|
  FactoryBot.create(:organization, user: user)
  FactoryBot.create_list(:micropost, 10, author: user)
end

Organization.all.each do |organization|
  FactoryBot.create_list(:user, 10, organization: organization, password: '123456')
  FactoryBot.create_list(:gift, 10, :with_image, organization: organization)
end

FactoryBot.create(:user, :superadmin)

FactoryBot.create_list(:feedback, 30)

FactoryBot.create_list(:category, 8)

Category.all.each do |category|
  FactoryBot.create_list(:post, 5, :with_image, category: category)
end
FactoryBot.create(:user, :superadmin, email: "team.giftify@gmail.com", password: "123giftify456")
