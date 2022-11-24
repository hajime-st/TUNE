FactoryBot.define do
  factory :user, aliases: [:owner] do
    name { "Tester" }
    email { "tester@example.com" }
    password { "dottle-nouveau-pavilion-tights-furze" }
    password_confirmation { "dottle-nouveau-pavilion-tights-furze" }
  end
end