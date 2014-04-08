require 'spec_helper'

describe Post do
  context 'creating' do
    it 'lets the user view the New page' do
      visit new_post_path
      page.should have_content 'New Post'
    end

    it 'lets users create a new post' do
      post = FactoryGirl.build :post
      visit new_post_path
      fill_in 'Title', with: post.title
      fill_in 'User', with: post.user
      click_button 'Create Post'
      page.should have_content post.title
    end
  end

  context 'viewing' do
    it 'can be viewed' do
      post = FactoryGirl.create :post
      visit posts_path
      page.should have_content post.title
    end
  end
  context 'deleting' do
    it 'can be deleted' do
      post = FactoryGirl.create :post
      visit posts_path
      click_link "Delete"
      page.should_not have_content post.title
    end
  end
end
