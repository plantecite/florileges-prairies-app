# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryBot.define do
  factory :releve do
    date { "2014-06-10" }
    name { "MyText" }
    structure { "MyString" }
    fonction { "MyString" }
    time_start { "2014-06-10 20:47:00" }
    time_end { "2014-06-10 20:47:00" }
    hauteur { "MyString" }
    milieux { "MyString" }
    user { nil }
    site { nil }
    gestion { nil }
  end
end
