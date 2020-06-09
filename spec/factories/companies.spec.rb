FactoryBot.define do
  factory :company do
    name                  { '株式会社' }
    password              { '00000000' }
    password_confirmation { '00000000' }
  end
end
