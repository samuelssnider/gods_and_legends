FactoryBot.define do
  deities_random = rand(1..5)
  actors = []
  unless Deity.all.count == 0
    deities_random.times do 
      actors << Deity.all.sample
    end
  end
  factory :event do
    sequence(:title){|n| Faker::WorldOfWarcraft.unique.quote << n }
    sequence(:description){|n| Faker::Lovecraft.unique.sentence << n }
    deities {actors.map {|actor| actor}}
  end
end