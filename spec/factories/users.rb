FactoryBot.define do
  sequence :email do |n|
    "test#{n}@example.com"
  end

  factory :user do
    first_name { 'Test' }
    last_name { 'User' }
    email { generate :email }
    password { 'Password1' }
    password_confirmation { 'Password1' }
  end

  factory :admin_user, class: 'AdminUser' do
    first_name { 'Admin' }
    last_name { 'User' }
    email { generate :email }
    password { 'Password1' }
    password_confirmation { 'Password1' }
  end
end
