require 'rails_helper'

RSpec.describe User, type: :model do
  describe "valid attributes" do
    it "is valid with valid attributes" do
      user = User.create(username: "tester",
                         email: "test@test.com",
                         password: "test"        )
      expect(user).to be_instance_of(User)
    end
    
    it "is invalid without a username" do
      user = User.create(email: "test@test.com",
                         password: "test"        )
      expect(user.save).to be(false)
    end
    
    it "is invalid without a email" do
      user = User.create(username: "tester",
                         password: "test"        )
      expect(user.save).to eq(false)
    end
    
    it "is invalid without a password" do
      user = User.create(username: "tester",
                         email: "test@test.com")
      expect(user.save).to eq(false)
    end
    
    it "is invalid with a repeat username" do
      user_1 = User.create(username: "tester",
                           email: "test@test.com",
                           password: "test"        )
      user_2 = User.create(username: "tester",
                           email: "second@test.com",
                           password: "second"        )
      expect(user_2.save).to eq(false)
    end
    
    it "is invalid with a repeat email" do
      user_1 = User.create(username: "tester",
                           email: "test@test.com",
                           password: "test"        )
      user_2 = User.create(username: "second",
                           email: "test@test.com",
                           password: "second"        )
      expect(user_2.save).to eq(false)
      
    end
    
  end
end
