require 'rails_helper'

describe Mythology, type: :model do
  describe "valid attributes" do
    it "is valid with valid attributes" do
      mythology = Mythology.create(name: "Sam's Mythology",
                                   origin_story: "Once Upon a time...")
      expect(mythology.save).to be true
    end
    it {should validate_presence_of(:name) }
    it {should validate_uniqueness_of(:name) }
    it {should validate_presence_of(:origin_story) }
    it {should validate_uniqueness_of(:origin_story) }
  end
  describe "Relationships" do
    it { should have_many(:deities)}
  end
end