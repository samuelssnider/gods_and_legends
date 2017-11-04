require 'rails_helper'

RSpec.describe Event, type: :model do
  describe "valid attributes"
  it "is valid with valid attributes" do
    event = Event.create(title: "thing",
                         description: "this is a thing that happened")
    expect(event.save).to be true
  end
  
  it "is invalid without a title" do
    event = Event.create(description: "this is a thing that happened")
    expect(event.save).to be false
  end
  
  it "is invalid without a description" do
    event = Event.create(title: "thing")
    expect(event.save).to be false
  end
  
  it "is invalid without a unique title" do
    event_1 = Event.create(title: "thing",
                           description: "this is a thing that happened")
    event_2 = Event.create(title: "thing",
                           description: "this is a second thing that happened")
    expect(event_2.save).to be false
  end
  
  it "is invalid without a unique description" do
    event_1 = Event.create(title: "thing",
                           description: "this is a thing that happened")
    event_2 = Event.create(title: "thing two",
                           description: "this is a thing that happened")
    expect(event_2.save).to be false
  end
end
