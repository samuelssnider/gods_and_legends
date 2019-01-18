require 'rails_helper'

RSpec.describe Domain, type: :model do
  describe "valid attributes" do
    it "is valid with valid attributes" do
      domain = create(:domain)
      expect(domain.save).to be true
    end
  end
  
end
