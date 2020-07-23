FactoryBot.define do
  factory :recorder do
    name                  { 'hoge' }
    login_id              { 'abe' }
    password              { '00000000' }
    password_confirmation { '00000000' }
  end
end
