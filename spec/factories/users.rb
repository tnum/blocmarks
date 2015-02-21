FactoryGirl.define do
  factory :user do
  	name "John Smith"
    email "john@example.com"
    password "helloworld"
    password_confirmation "helloworld"
    confirmed_at Time.now 
  end

end
