require 'rails_helper'

RSpec.describe Domain, type: :model do
  describe "valid attributes" do
    it "is valid with valid attributes" do
      domain = create(:domain)
      expect(domain.save).to be true
    end
    it {should validate_presence_of(:name) }
    it {should validate_uniqueness_of(:name) }
  end
  
  describe "Relationships" do
    it { should have_many(:deity_domains) }
    it { should have_many(:deities).through(:deity_domains) }
  end
  
end
