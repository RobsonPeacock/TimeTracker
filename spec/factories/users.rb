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
    phone { '5555555555' }
    ssn { 1234 }
    company { 'Example Company' }
  end

  factory :admin_user, class: 'AdminUser' do
    first_name { 'Admin' }
    last_name { 'User' }
    email { generate :email }
    password { 'Password1' }
    password_confirmation { 'Password1' }
    phone { '5555555555' }
    ssn { 1234 }
    company { 'Example Company' }
  end

  factory :non_authorised_user, class: 'User' do
    first_name { 'Non' }
    last_name { 'Authorised' }
    email { generate :email }
    password { 'Password1' }
    password_confirmation { 'Password1' }
    phone { '5555555555' }
    ssn { 1234 }
    company { 'Example Company' }
  end
end
