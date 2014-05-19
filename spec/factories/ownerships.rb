# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :ownership do
    user_id 1
    site_id 1
    owner false
  end
end
