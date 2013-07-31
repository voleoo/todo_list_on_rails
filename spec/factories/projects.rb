# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :project do
    name "MyString"
    deadline "2013-08-01"
    user_id 1
  end
end
