FactoryBot.define do
  factory :answer do
    body { FFaker::Lorem.paragraphs(rand(2..8)).join('.') }
  end
end