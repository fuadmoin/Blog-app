require 'rails_helper'

RSpec.describe 'User index page', type: :feature do
  before do
    # Create some users with posts
    @user1 = User.create!(name: 'John Doe', posts_counter: 0)
    @user2 = User.create!(name: 'John Do', posts_counter: 0)
    @post1 = @user1.posts.create!(title: 'Test Post', likes_counter: 0, comments_counter: 0)
    @post2 = @user2.posts.create!(title: 'Test Post2', likes_counter: 0, comments_counter: 0)
  end

  it 'displays the username of all other users' do
    visit users_path
    expect(page).to have_content(@user1.name)
    expect(page).to have_content(@user2.name)
  end

  it 'displays the profile picture for each user' do
    visit users_path
    expect(page).to have_css("img[src*='#{@user1.photo}']")
  end

  it 'displays the number of posts each user has written' do
    visit users_path
    expect(page).to have_content(@user1.posts.count)
    expect(page).to have_content(@user2.posts.count)
  end

  it 'redirects to the user show page when clicking on a user' do
    visit users_path
    click_on @user1.name
    expect(current_path).to eq(user_path(@user1))
  end
end
