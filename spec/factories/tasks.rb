# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :task do
    name "MyString"
    position "MyString"
    done ""
    project_id 1
  end
end
