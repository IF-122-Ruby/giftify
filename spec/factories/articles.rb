# == Schema Information
#
# Table name: articles
#
#  id         :bigint           not null, primary key
#  body       :string           not null
#  page_name  :string           not null
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :article do
    title { Faker::Company.name }
    page_name { "help" }
    body { "<CENTER> Hello</CENTER><HR>to another nifty site<H1>This is a Header</H1><H2>This is a Medium Header</H2>      
      support@yourcompany.com</a>.      
      <P> This is a new paragraph!      
      <P> <B>This is a new paragraph!</B>      
      <BR> <B><I>This is a new sentence without a paragraph break, in bold italics.</I></B>      
      <HR>" }
  end
end
