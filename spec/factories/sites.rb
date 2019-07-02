# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryBot.define do
  factory :site do
    code { "MyString" }
    name { "MyString" }
    parc { "MyString" }
    latitude { "9.99" }
    longitude { "9.99" }
    location { "MyString" }
  end
end
