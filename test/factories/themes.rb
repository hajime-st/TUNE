FactoryBot.define do
  factory :theme do
    title { "test" }
    association :user
  end
end