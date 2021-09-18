FactoryBot.define do
  factory :idea do
    association :category, factory: :category
    body { 'hogehoge' }
  end
end
