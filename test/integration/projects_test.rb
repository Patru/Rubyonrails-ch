# test/integration/projects_test.rb
require 'test_helper'

describe 'Wiki Home integration' do

  it 'wants to visit the wiki page' do
    visit wiki_app_path
    page.html.must_match(/Home/)
    page.has_content?("I am certainly not on this page")                  # will *not* fail, just a test, not a promise
    refute page.has_content?("I am certainly not on this page"),          "works, but its an assertion ..."
    page.has_content?("I am certainly not on this page").must_equal false # capybara spec version
    page.wont_have_content "I am certainly not on this page"              # capybara rails version, that's more like it
    page.must_have_content "All Pages"                                     # should be somewhere on the page
    within "#head .actions" do
      page.must_have_content "All Pages"                           # actually found in the head div in the actions list
      page.must_have_content "New Page"
      page.must_have_content "Edit Page"
      page.must_have_content "Page History"
    end
  end

  it "wants to search for the home page and find it" do
    visit wiki_app_path
    fill_in 'search-query', with: 'Home'
    click_link "search-submit"
    within "title" do
      page.must_have_content("Search results for Home")
    end
    within "body" do
      save_and_open_page
      page.must_have_content("Search Results for Home")
    end
  end

end