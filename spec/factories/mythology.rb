FactoryBot.define do
  factory :mythology do
    sequence :name do |i|
      "Myth#{i}"
    end
    sequence :origin_story do |i|
      "#{i}insert lorem here"
    end
  end
end
