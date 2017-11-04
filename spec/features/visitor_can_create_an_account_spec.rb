require 'rails_helper'

feature "New user can create an account" do
  scenario "should see a link for create account on root page" do
    visit '/'
    click_on "Login"

    expect(current_path).to eq(login_path)

    click_on "Create an account"

    fill_in "user[email]", with: "test@testmail.com"
    fill_in "user[username]", with: "test"
    fill_in "user[password]", with: "testing"

    click_on "Create User"

    expect(current_path).to eq('/')
    expect(page).to have_content "Logged in as test"
    expect(page).to have_content "test@testmail.com"
    expect(page).to_not have_link "Login"
    expect(page).to have_link "Logout"
  end
end
