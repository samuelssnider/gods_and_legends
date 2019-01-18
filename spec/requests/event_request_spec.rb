require 'rails_helper'

describe "when i send a get request to api-v1-events" do
  it "I should recieve a 200 response with all the events" do
    deities = create_list(:deity, 5)
    events = create_list(:event, 10)
    event_1 = Event.first
    event_2 = Event.last
    
    get '/api/v1/events'
    
    json_deduced = JSON.parse(response.body)
    
    expect(response).to have_http_status(200)
    expect(json_deduced.count).to eq(10)
    expect(json_deduced.first.count).to eq(6)
    expect(json_deduced.first["title"]).to eq(event_1.title)
    expect(json_deduced.first["description"]).to eq(event_1.description)
    expect(json_deduced.last["title"]).to eq(event_2.title)
    expect(json_deduced.last["description"]).to eq(event_2.description)
  end
  
  it "it should return one event" do
    events = create_list(:event, 10)
    event_1 = Event.first
    
    get "/api/v1/events/#{event_1.id}"
    
    json_deduced = JSON.parse(response.body)
    
    expect(response).to have_http_status(200)
    expect(json_deduced.count).to eq(6)
    expect(json_deduced["title"]).to eq(event_1.title)
    expect(json_deduced["description"]).to eq(event_1.description)
  end
  
  it "should return all of an event's deities" do
    create(:event)
    event = Event.first
    deities = create_list(:deity, 5, events: [event])
    deity_1 = event.deities.first
    deity_2 = event.deities.last
    
    get "/api/v1/events/#{event.id}/deities"
    
    json_deduced = JSON.parse(response.body)
    expect(response).to have_http_status(200)
    expect(json_deduced.count).to eq(5)
    expect(json_deduced.first.count).to eq(10)
  end
end