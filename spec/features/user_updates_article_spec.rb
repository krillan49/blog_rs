require "rails_helper"

feature "Article Creation" do
  before(:each) do
    sign_up
    create_article
  end

  scenario "allows user to visit edit article page" do
    visit articles_path
    click_link('Edit article')

    expect(page).to have_content I18n.t('articles.edit.header')
  end

  scenario "allows user to update article" do
    visit articles_path
    click_link('Edit article')

    fill_in :article_title, with: 'Test article2'
    fill_in :article_text, with: 'Some text2'
    click_button 'Save Article'

    expect(page).to have_content I18n.t('articles.show.new_comment')
  end
end