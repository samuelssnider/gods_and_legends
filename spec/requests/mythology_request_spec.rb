require 'rails_helper'

describe "when i send a get request to api-v1-mythologies" do
  it "I should recieve all mythologies" do
    mythologies = create_list(:mythology, 10)
    mythology_1 = Mythology.first
    mythology_2 = Mythology.last
    
    get "/api/v1/mythologies"
    
    json_deduced = JSON.parse(response.body)
    
    expect(response).to have_http_status(200)
    expect(json_deduced.count).to eq(10)
    expect(json_deduced.first.count).to eq(6)
    expect(json_deduced.first["name"]).to eq(mythology_1.name)
    expect(json_deduced.first["origin_story"]).to eq(mythology_1.origin_story)
    expect(json_deduced.last["name"]).to eq(mythology_2.name)
    expect(json_deduced.last["origin_story"]).to eq(mythology_2.origin_story)  
  end
  
  it "I should recieve all mythologies" do
    mythologies = create_list(:mythology, 2)
    mythology_1 = Mythology.first
    
    get "/api/v1/mythologies/#{mythology_1.id}"
    
    json_deduced = JSON.parse(response.body)
    
    expect(response).to have_http_status(200)
    expect(json_deduced.count).to eq(6)
    expect(json_deduced["name"]).to eq(mythology_1.name)
    expect(json_deduced["origin_story"]).to eq(mythology_1.origin_story)
  end
  
  it "I should recieve all a mythologies deities" do
    mythologies = create(:mythology)
    mythology = Mythology.first
    deities = create_list(:deity, 10, mythology: mythology)
    deity_1 = Deity.first
    deity_2 = Deity.last
    
    get "/api/v1/mythologies/#{mythology.id}/deities"
    
    json_deduced = JSON.parse(response.body)
    
    expect(response).to have_http_status(200)
    expect(json_deduced.count).to eq(10)
    expect(json_deduced.first.count).to eq(10)
    expect(json_deduced[2]["name"]).to eq(deity_1.name)
    expect(json_deduced[2]["description"]).to eq(deity_1.description)
    expect(json_deduced.last["name"]).to eq(deity_2.name)
    expect(json_deduced.last["description"]).to eq(deity_2.description)
  end
end