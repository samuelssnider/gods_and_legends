require 'rails_helper'

describe "when i send a get request to api/v1/deities" do
  it "I should recieve a 200 respose with all the deities" do
    deities = create_list(:deity, 10)
    deity_1 = Deity.first
    deity_2 = Deity.last
    
    get '/api/v1/deities'
    
    json_deduced = JSON.parse(response.body)
    
    expect(response).to have_http_status(200)
    expect(json_deduced.count).to eq(10)
    expect(json_deduced.first.count).to eq(10)
    expect(json_deduced.first["name"]).to eq(deity_1.name)
    expect(json_deduced.first["description"]).to eq(deity_1.description)
    expect(json_deduced.last["name"]).to eq(deity_2.name)
    expect(json_deduced.last["description"]).to eq(deity_2.description)
  end
  
  it "should receive one deity when i add a /:deity_id" do
    deities = create_list(:deity, 2)
    deity_1 = Deity.first
    
    get "/api/v1/deities/#{deity_1.id}"
    
    json_deduced = JSON.parse(response.body)
    
    expect(response).to have_http_status(200)
    expect(json_deduced.count).to eq(10)
    expect(json_deduced["name"]).to eq(deity_1.name)
    expect(json_deduced["description"]).to eq(deity_1.description)
  end
  
  it "should be able to retreive a deity's mythology namespaced under /:diety_id/mythology" do
    deities = create(:deity)
    deity_1 = Deity.first
    mythology = Mythology.first
    expect(deity_1.mythology).to eq(mythology)
    
    get "/api/v1/deities/#{deity_1.id}/mythology"
    
    json_deduced = JSON.parse(response.body)
    
    expect(response).to have_http_status(200)
    expect(json_deduced.count).to eq(6)
    expect(json_deduced["name"]).to eq(mythology.name)
    expect(json_deduced["origin_story"]).to eq(mythology.origin_story)
  end
  
  it "should be able to return a deity's events namespaced under /:diety_id/events" do
    deity = create(:deity)
    events = create_list(:event, 10, deities: [deity])
    event_1 = Event.first
    event_2 = Event.last
    get "/api/v1/deities/#{deity.id}/events"
    
    json_deduced = JSON.parse(response.body)
    
    expect(response).to have_http_status(200)
    expect(json_deduced.count).to eq(10)
    expect(json_deduced.first.count).to eq(5)
    expect(json_deduced.first["title"]).to eq(event_1.title)
    expect(json_deduced.first["description"]).to eq(event_1.description)
    expect(json_deduced.last["title"]).to eq(event_2.title)
    expect(json_deduced.last["description"]).to eq(event_2.description)
  end
  
  it "should find a deity's parents namespaced under /:diety_id/parents" do
    deities = create_list(:deity, 2)
    deity_1 = Deity.first
    deity_2 = Deity.last
    deity_child = create(:deity)
    deity_child.parents << [deity_1, deity_2]
    
    get "/api/v1/deities/#{deity_child.id}/parents"
    
    json_deduced = JSON.parse(response.body)
    
    expect(response).to have_http_status(200)
    expect(json_deduced.count).to eq(2)
    expect(json_deduced.first.count).to eq(10)
    expect(json_deduced.first["name"]).to eq(deity_1.name)
    expect(json_deduced.first["description"]).to eq(deity_1.description)
    expect(json_deduced.last["name"]).to eq(deity_2.name)
    expect(json_deduced.last["description"]).to eq(deity_2.description)
  end
  
  it "should find a deity's children namespaced under /:diety_id/children" do
    deities = create_list(:deity, 3)
    deity_parent = Deity.first
    deity_child_1 = deities[1]
    deity_child_2 = deities[2]
    deity_child_1.parents << [deity_parent]
    deity_child_2.parents << [deity_parent]
    
    get "/api/v1/deities/#{deity_parent.id}/children"
    
    json_deduced = JSON.parse(response.body)
    
    expect(response).to have_http_status(200)
    expect(json_deduced.count).to eq(2)
    expect(json_deduced.first.count).to eq(10)
    expect(json_deduced.first["name"]).to eq(deity_child_1.name)
    expect(json_deduced.first["description"]).to eq(deity_child_1.description)
    expect(json_deduced.last["name"]).to eq(deity_child_2.name)
    expect(json_deduced.last["description"]).to eq(deity_child_2.description)
  end
  
  
  
end