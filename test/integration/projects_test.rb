# test/integration/projects_test.rb
require 'test_helper'

describe 'Project integration' do

  it 'wants to visit the wiki page and find the home-page' do
    visit wiki_app_path
    fill_in 'search-query', with: 'Home'
    click_link "search-submit"
#    page.has_content?("foo")
    page.must_have_content("Search Results for")
#    page.must_have_content("Search Results for Home2")
#    page.must_be_nil
#    fill_in 'Title', with: 'Blog about this'
#    click_button 'Save'
#    project = Project.first
#    within "#project_#{project.id}" do
#      page.has_content?('Blog about this').must_be true
#    end
  end

end