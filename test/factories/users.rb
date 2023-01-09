FactoryBot.define do
  factory :user, aliases: [:owner] do
    name { "Tester" }
    sequence(:username) { |n| "tester#{n}" }
    sequence(:email) { |n| "tester#{n}@example.com" }
    password { "dottle-nouveau-pavilion-tights-furze" }
    password_confirmation { "dottle-nouveau-pavilion-tights-furze" }
  end
end