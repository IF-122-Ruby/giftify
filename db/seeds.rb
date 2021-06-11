FactoryBot.create_list(:user, 2)

User.all.each do |user|
  FactoryBot.create(:organization, user: user)
end

Organization.all.each do |organization|
  FactoryBot.create_list(:user, 10, organization: organization, password: '123456')  
end

FactoryBot.create_list(:feedback, 30)

FactoryBot.create(:user, :superadmin)

FactoryBot.create_list(:category, 8)

Category.all.each do |category|
  FactoryBot.create_list(:post, 5, :with_image, category: category)
end

