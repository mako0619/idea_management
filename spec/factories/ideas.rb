FactoryBot.define do
  factory :idea do
    association :category, factory: :category
    body { 'BLEACH' }
  end
end
