
FactoryBot.create_list(:user, 5)

User.all.each do |user|
  FactoryBot.create(:organization, user_id: user.id)
end

Organization.all.each do |organization|
  FactoryBot.create_list(:user, 10, organization: organization)  
end
