require 'rails_helper'

RSpec.describe 'User show page', type: :feature do
  before do
    # Create a user with posts
    @user = User.create!(name: 'John Doe', bio: 'My bio', posts_counter: 0)
    @post1 = @user.posts.create!(title: 'first', likes_counter: 0, comments_counter: 0)
    @post2 = @user.posts.create!(title: 'second', likes_counter: 0, comments_counter: 0)
    @post3 = @user.posts.create!(title: 'three', likes_counter: 0, comments_counter: 0)
    @post4 = @user.posts.create!(title: 'four', likes_counter: 0, comments_counter: 0)
  end

  it "displays the user's profile picture" do
    visit user_path(@user)
    expect(page).to have_css("img[src*='#{@user.photo}']")
  end

  it "displays the user's username" do
    visit user_path(@user)
    expect(page).to have_content(@user.name)
  end

  it 'displays the number of posts the user has written' do
    visit user_path(@user)
    expect(page).to have_content(@user.posts.count)
  end

  it "displays the user's bio" do
    visit user_path(@user)
    expect(page).to have_content(@user.bio)
  end

  it "displays the user's first 3 posts" do
    visit user_path(@user)
    expect(page).to have_content(@post4.title)
    expect(page).to have_content(@post2.title)
    expect(page).to have_content(@post3.title)
    expect(page).not_to have_content(@post1.title)
  end

  it "displays a button that lets me view all of a user's posts" do
    visit user_path(@user)
    expect(page).to have_link('See all posts', href: user_posts_path(@user))
  end

  it 'redirects to the post show page when clicking on a post' do
    visit user_path(@user)
    find_link(@post4.title).click
    expect(current_path).to eq(user_post_path(@user, @post4))
  end

  it "redirects to the user's posts index page when clicking to see all posts" do
    visit user_path(@user)
    find_link('See all posts', href: user_posts_path(@user)).click
    expect(current_path).to eq(user_posts_path(@user))
  end
end
