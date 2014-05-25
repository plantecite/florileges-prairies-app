# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :relefe, :class => 'Releve' do
    date "2014-05-24"
    name "MyText"
    structure "MyString"
    fonction "MyString"
    time_start "2014-05-24 12:33:01"
    time_end "2014-05-24 12:33:01"
    hauteur "MyString"
    milieux "MyString"
    user nil
    site nil
    gestion nil
  end
end
