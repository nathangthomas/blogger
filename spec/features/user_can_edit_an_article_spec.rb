require 'rails_helper'

describe 'user can edit an article' do
  describe 'they link from a show page' do
    it 'they are able to edit the article' do

      article_1 = Article.create!(title: "Title 1", body: "Body 1")


      visit article_path(article_1)
      click_link 'Edit'

      expect(current_path).to eq(edit_article_path(article_1))

      fill_in "article[title]", with: "This is an edited title."
      fill_in "article[body]", with: "This is an edited body."

      click_on "Update Article"

      expect(page).to have_content("This is an edited title.")
      expect(page).to_not have_content("New Title!")
      expect(page).to have_content("Your article has been updated!")
    end
  end
end
