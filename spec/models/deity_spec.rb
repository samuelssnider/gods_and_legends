require 'rails_helper'

RSpec.describe Deity, type: :model do
  describe "valid attributes" do
    it "is valid with valid attributes" do
      mythology = create(:mythology)
      deity = Deity.create(name: "Test God",
                           description: "The Test God",
                           tier: 3,
                           gender: 0,
                           classification: "God",
                           mythology: mythology )
      expect(deity.save).to be true
    end
  end
  it {should validate_presence_of(:name) }
  it {should validate_uniqueness_of(:name) }
  it {should validate_presence_of(:description) }
  it {should validate_presence_of(:tier) }
  it {should validate_presence_of(:gender) }
  it {should validate_presence_of(:classification) }
  it {should validate_presence_of(:mythology_id) }
end