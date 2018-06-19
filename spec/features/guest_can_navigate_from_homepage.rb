require 'rails_helper'

RSpec.describe "As a guest I can navigate from the homepage" do
  
  it "If I click on Deities Hyperlink" do
    visit '/'
    
    click_on('Mythologies')
    
    expect(path).to be
  end
  
  it "If I click on Myths Hyperlink" do
    
  end
  
  it "If I click on Mythologies Hyperlink" do
    
  end
  
  it "If I click on API Documentation Hyperlink" do
    
  end
end