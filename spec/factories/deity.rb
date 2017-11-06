FactoryBot.define do
  tier_random = rand(0..4)
  gender_random = rand(0..3)
  factory :deity do
    sequence(:name){|n| Faker::Lovecraft.unique.sentence << n }
    sequence(:description){|n| Faker::Lovecraft.unique.sentence << n }
    tier tier_random
    gender gender_random
    classification Faker::Lovecraft.unique.words(1)
    mythology_id { FactoryBot.create(:mythology).id }
  end
end
