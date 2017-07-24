require 'rails_helper'
RSpec.configure do |config|
  config.include Devise::Test::IntegrationHelpers, type: :feature
end

describe "User creates a new job" do
  scenario "a user can create a profile" do

      user = User.create(name: "Usericus",
                         email: "usericus@example.com",
                        password: "password")

      visit login_path

      profile_attributes = {
                            photo:  "http://robohash.org/yohanan",
                            location: "Washington DC",
                            interest: "So many",
                            classification: "you tell me",
                            age: 33,
                            body_type: "Super Cute"
                          }


    visit new_user_profile_path(user)

    fill_in "profile[photo]", with: profile_attributes[:photo]
    fill_in "profile[location]", with: profile_attributes[:location]
    fill_in "profile[interest]", with: profile_attributes[:interest]
    fill_in "profile[classification]", with: profile_attributes[:classification]
    fill_in "profile[age]", with: profile_attributes[:age]
    fill_in "profile[body_type]", with: profile_attributes[:body_type]

    click_button "Create profile"

    user_profile = user.profile

    expect(current_path).to eq("/users/#{user.id}/profiles/#{Profile.last.id}")
    expect(page).to have_content("Washington DC")
    expect(page).to have_content("Super Cute")
    expect(page).to have_content(33)
  end
end
