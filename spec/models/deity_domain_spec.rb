require 'rails_helper'

RSpec.describe DeityDomain, type: :model do
  describe "Relationships" do
    it { should belong_to(:deity) }
    it { should belong_to(:domain)}
  end
end
