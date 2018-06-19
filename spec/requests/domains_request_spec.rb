require 'rails_helper'

describe "when i send a get request to api/v1/domains" do
  it "I should recieve a 200 respose with all the domains" do
    domains = create_list(:domain, 10)
    domain_1 = Domain.first
    domain_2 = Domain.last
    
    get '/api/v1/domains'
    
    json_deduced = JSON.parse(response.body)
    
    expect(response).to have_http_status(200)
    expect(json_deduced.count).to eq(10)
    expect(json_deduced.first["name"]).to eq(domain_1.name)
    expect(json_deduced.last["name"]).to eq(domain_2.name)
  end
  it "and namespace with /:domain_id, I should recieve a 200 respose with a single domain" do
    domains = create_list(:domain, 10)
    domain_1 = Domain.first
    
    get "/api/v1/domains/#{domain_1.id}"
    
    json_deduced = JSON.parse(response.body)
    
    expect(response).to have_http_status(200)
    expect(json_deduced["name"]).to eq(domain_1.name)
  end
end

