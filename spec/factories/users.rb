FactoryBot.define do
  factory :user do
    password = Faker::Internet.password(min_length: 8)
    username { Faker::Name.last_name }
    email { Faker::Internet.free_email }
    password { password }
    password_confirmation { password }
    confirmed_at { Date.today }
  end
end
