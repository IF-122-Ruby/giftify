# == Schema Information
#
# Table name: articles
#
#  id              :bigint           not null, primary key
#  body            :string           not null
#  category        :string           not null
#  title           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  organization_id :bigint
#
# Indexes
#
#  index_articles_on_organization_id  (organization_id)
#
FactoryBot.define do
  factory :article do
    title { Faker::Company.name }
    category { Article::CATEGORIES.sample }
    body { "<CENTER> Hello</CENTER><HR>to another nifty site<H1>This is a Header</H1><H2>This is a Medium Header</H2>      
      support@yourcompany.com</a>.      
      <P> This is a new paragraph!      
      <P> <B>This is a new paragraph!</B>      
      <BR> <B><I>This is a new sentence without a paragraph break, in bold italics.</I></B>      
      <HR>" }
    organization
  end
end
