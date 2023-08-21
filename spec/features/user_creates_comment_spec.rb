require "rails_helper"

feature "Comment Creation" do
  before(:each) do
    sign_up
    create_article
  end

  scenario "allows user to create comment" do
    fill_in :comment_body, with: 'Test comment'
    click_button 'Create Comment'

    expect(page).to have_content 'Test comment'
  end
end