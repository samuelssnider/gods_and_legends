FactoryBot.define do
  factory :domain do |i|
    sequence :name do |i|
      "Domain#{i}"
    end
  end
end
