require 'rails_helper'

RSpec.describe "Users::users", type: :request do
  let!(:user) { create :user }

  describe 'GET #index' do
    context 'ユーザが存在する場合' do
    before do
      visit new_user_session_path
      fill_in 'user[email]', with: user.email
      fill_in 'user[password]', with: user.password
      click_button 'Log In'
    end
      it '正常なレスポンスを返すこと' do
        get root_path
        expect(response.status).to eq 302
      end
    end
  end
end