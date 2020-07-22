FactoryBot.define do
  factory :user do
    login_id                  { 'abe' }
    password              { '00000000' }
    password_confirmation { '00000000' }
  end
end
