require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  let(:user) { User.create!(name: 'Test User', posts_counter: 0) }

  describe 'GET #index' do
    it 'assigns the requested user as @user' do
      get :index, params: { user_id: user.to_param }
      expect(assigns(:user)).to eq(user)
    end

    it 'assigns the user posts as @posts' do
      post = user.posts.create!(title: 'Test Post', likes_counter: 0, comments_counter: 0)
      get :index, params: { user_id: user.to_param }
      expect(assigns(:posts)).to eq([post])
    end
  end

  describe 'GET #show' do
    context 'when the post exists' do
      it 'assigns the requested user as @user' do
        post = user.posts.create!(title: 'Test Post', likes_counter: 0, comments_counter: 0)
        get :show, params: { user_id: user.to_param, id: post.to_param }
        expect(assigns(:user)).to eq(user)
      end

      it 'assigns the requested post as @post' do
        post = user.posts.create!(title: 'Test Post', likes_counter: 0, comments_counter: 0)
        get :show, params: { user_id: user.to_param, id: post.to_param }
        expect(assigns(:post)).to eq(post)
      end
    end

    context 'when the post does not exist' do
      it 'redirects to the user posts list' do
        get :show, params: { user_id: user.to_param, id: -1 }
        expect(response).to redirect_to(user_posts_path(user))
      end
    end
  end
end
