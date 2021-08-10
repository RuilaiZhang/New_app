FactoryBot.define do
  factory :listing do
    user { nil }
    title { "MyString" }
    condition { 1 }
    price { 1 }
    description { "MyText" }
    sold { false }
  end
end
