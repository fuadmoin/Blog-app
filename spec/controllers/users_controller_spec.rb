require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET #index' do
    it 'assigns all users as @users' do
      user = User.create!(name: 'John Doe', posts_counter: 0)
      get :index
      expect(assigns(:users)).to eq([user])
    end
  end

  describe 'GET #show' do
    context 'when the user exists' do
      it 'assigns the requested user as @user' do
        user = User.create!(name: 'John Doe', posts_counter: 0)
        get :show, params: { id: user.to_param }
        expect(assigns(:user)).to eq(user)
      end
    end

    context 'when the user does not exist' do
      it 'redirects to the users list' do
        get :show, params: { id: -1 }
        expect(response).to redirect_to(users_path)
      end
    end
  end
end
