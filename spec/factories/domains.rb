FactoryBot.define do
  factory :domain do |i|
    name Faker::Lovecraft.unique.words(1)
  end
end
