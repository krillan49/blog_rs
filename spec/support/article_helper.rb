def create_article
  visit new_article_path
  fill_in :article_title, with: 'Test article'
  fill_in :article_text, with: 'Some text'
  click_button 'Save Article'
end