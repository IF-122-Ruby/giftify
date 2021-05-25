
FactoryBot.create_list(:user, 10)
User.all.each do |user|
  FactoryBot.create(:organization, user_id: user.id )
end
