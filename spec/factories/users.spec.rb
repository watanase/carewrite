FactoryBot.define do
  factory :user do
    name                  { 'abe' }
    password              { '00000000' }
    password_confirmation { '00000000' }
  end
end
