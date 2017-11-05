require 'rails_helper'

describe "when i send a get request to api-v1-deities" do
  it "I should recieve a 200 respose with all the deities" do
    deities = create_list(:deity, 10)
    deity_1 = Deity.first
    deity_2 = Deity.last
    
    get '/api/v1/deities'
    
    json_deduced = JSON.parse(response.body)
    
    expect(response).to have_http_status(200)
    expect(json_deduced.count).to eq(10)
    expect(json_deduced.first.count).to eq(9)
    expect(json_deduced.first["name"]).to eq(deity_1.name)
    expect(json_deduced.first["description"]).to eq(deity_1.description)
    expect(json_deduced.last["name"]).to eq(deity_2.name)
    expect(json_deduced.last["description"]).to eq(deity_2.description)
  end
  
  it "should receive one deity" do
    deities = create_list(:deity, 2)
    deity_1 = Deity.first
    
    get "/api/v1/deities/#{deity_1.id}"
    
    json_deduced = JSON.parse(response.body)
    
    expect(response).to have_http_status(200)
    expect(json_deduced.count).to eq(9)
    expect(json_deduced["name"]).to eq(deity_1.name)
    expect(json_deduced["description"]).to eq(deity_1.description)
  end
  
  it "should be able to retreive a deity's mythology" do
    deities = create(:deity)
    deity_1 = Deity.first
    mythology = Mythology.first
    expect(deity_1.mythology).to eq(mythology)
    
    get '/api/v1/deities/1/mythology'
    
    json_deduced = JSON.parse(response.body)
    
    expect(response).to have_http_status(200)
    expect(json_deduced.count).to eq(4)
    expect(json_deduced["name"]).to eq(mythology.name)
    expect(json_deduced["origin_story"]).to eq(mythology.description)
  end
  
  it "should be able to return a deity's events" do
    deity = create(:deity)
    events = create_list(:event, 10, deities: [deity])
    event_1 = Event.first
    event_2 = Event.last
    get '/api/v1/deities/1/events'
    
    json_deduced = JSON.parse(response.body)
    
    expect(response).to have_http_status(200)
    expect(json_deduced.count).to eq(10)
    expect(json_deduced.first.count).to eq(4)
    expect(json_deduced.first["title"]).to eq(event_1.name)
    expect(json_deduced.first["origin_story"]).to eq(event_1.description)
    expect(json_deduced.last["title"]).to eq(event_2.name)
    expect(json_deduced.last["origin_story"]).to eq(event_2.description)
  end
  
end