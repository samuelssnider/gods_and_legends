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
end