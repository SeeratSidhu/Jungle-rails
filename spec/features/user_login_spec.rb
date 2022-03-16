require 'rails_helper'

RSpec.feature "User can log in", type: :feature, js: true do
  
  before :each do
   @user = User.create!(email: "example@example.com", password: "123456", password_confirmation: "123456", first_name: "Test", last_name: "User")

  end

  scenario "They can log in successfully with valid credentials" do

    visit login_path

    fill_in 'email', with: 'example@example.com'
    fill_in 'password', with: '123456'

    click_button 'Submit'

    expect(page.has_css?("nav.navbar li", text: "Signed in as Test")).to be_truthy
  end


end
