require 'rails_helper'

describe 'user can delete an article' do
  describe 'when user clicks on the delete article button' do
    it 'the article is deleted' do
      article_1 = Article.create!(title: "Title 1", body: "Body 1")
      article_2 = Article.create!(title: "Title 2", body: "Body 2")


      visit article_path(article_1)
      click_link 'Delete'

      expect(current_path).to eq(articles_path)

      expect(page).to have_content(article_2.title)
      expect(page).to_not have_content(article_1.title)
    end
  end
end
