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
  
  it "and namespace with /:domain_id/deities, I should recieve a 200 respose with a single deity related to that domain" do
    domain = create(:domain)
    deity  = create(:deity)
    deity.domains << domain
    domain = Domain.first
    
    get "/api/v1/domains/#{domain.id}/deities"
    
    json_deduced = JSON.parse(response.body)
    
    expect(response).to have_http_status(200)
    expect(json_deduced.first["name"]).to eq(deity.name)
    expect(json_deduced.first["description"]).to eq(deity.description)
  end
  
  it "and namespace with /:domain_id/deities, I should recieve a 200 respose with a single deity related to that domain" do
    domain   = create(:domain)
    deities  = create_list(:deity, 2)
    deity_1  = Deity.first
    deity_2  = Deity.last
    deities.each do |deity|
      deity.domains << domain
    end
    
    get "/api/v1/domains/#{domain.id}/deities"
    
    json_deduced = JSON.parse(response.body)
    
    expect(response).to have_http_status(200)
    expect(json_deduced.first["name"]).to eq(deity_1.name)
    expect(json_deduced.first["description"]).to eq(deity_1.description)
    expect(json_deduced.last["name"]).to eq(deity_2.name)
    expect(json_deduced.last["description"]).to eq(deity_2.description)
  end
end

