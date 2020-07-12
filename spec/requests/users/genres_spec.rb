require 'rails_helper'

describe 'genreのテスト' do
  let(:user) { create(:user) }
  let!(:user2) { create(:user) }
  let!(:genre) { create(:genre, user: user, name: '予定') }
  let!(:genre2) { create(:genre, user: user, name: '勉強時間') }


  describe 'GET #index' do
    before do
      visit new_user_session_path
      fill_in 'user[email]', with: user.email
      fill_in 'user[password]', with: user.password
      click_button 'Log In'
    end
    it 'リクエストが成功すること' do
      get genres_url
      expect(response.status).to eq 302
    end
  end
end