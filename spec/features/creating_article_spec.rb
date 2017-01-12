require "rails_helper"

RSpec.feature "Creating Articles" do
  scenario "User creates a new article" do
    visit "/"
    click_link "New Article"
    fill_in "Title", with: "Creating a Blog"
    fill_in "Body", with: "Lorem ipsum"
    click_button "Create Article"

    expect(page).to have_content("Article has been created")
    expect(page.current_path).to eq(articles_path)
  end

  scenario "A user fails to create a new article" do
    visit "/"
    click_link "New Article"
    fill_in "Title", with: ""
    fill_in "Body", with: ""
    click_button "Create Article"

    expect(page).to have_content("Article has not been created!")
    expect(page).to have_content("Title cannot be blank!")
    expect(page).to have_content("Article cannot be blank!")
  end
end
