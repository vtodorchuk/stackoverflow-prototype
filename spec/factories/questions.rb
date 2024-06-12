FactoryBot.define do
  factory :question do
    title { FFaker::Lorem.words(rand(2..10)).join(' ') }
    body { FFaker::Lorem.paragraphs(rand(2..8)).join('.') }
  end

  factory :invalid_question, class: 'Question' do
    title { nil }
    body { nil }
  end
end