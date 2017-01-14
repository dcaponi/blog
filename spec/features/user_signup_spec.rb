require 'rails_helper'

RSpec.feature "user signup" do
  scenario "with valid input" do
    visit "/"
    click_link "Sign Up"
    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "Password"
    fill_in "Confirm Password", with: "Password"
    click_button "Sign Up"

    expect(page).to have_content("Welcome! Thanks for signing up.")
  end

  scenario "with invalid input" do
    visit "/"
    click_link "Sign Up"
    fill_in "Email", with: ""
    fill_in "Password", with: ""
    fill_in "Confirm Password", with: ""
    click_button "Sign Up"

    expect(page).to have_content("Oops! Something is wrong with the form. Please try again")
  end
end
