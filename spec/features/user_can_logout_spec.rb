require 'rails_helper'

RSpec.describe "As a visitor I can login and logout" do
 it "as a user I can log out" do
   user = User.create(username: "test", email: "testerson@testmail.com", password: "testing")
   visit '/login'
   fill_in "session[username]", with: "test"
   fill_in "session[password]", with: "testing"
   click_on "Login"
   expect(current_path).to eq('/')
   expect(page).to have_content("Logged in as test")
   click_on 'Logout'
   expect(page).to have_content("Login")
  end
end