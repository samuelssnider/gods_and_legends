require 'rails_helper'

describe "when i send a get request to api/v1/domains" do
  it "I should recieve a 200 respose with all the domains" do
    domains = create_list(:domain, 10)
  end
end