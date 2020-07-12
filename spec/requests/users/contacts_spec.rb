require 'rails_helper'

describe 'contactのテスト' do
  let(:user) { create(:user) }
  let!(:contact) do
    create(:contact,
           user: user,
           email: 'hogehoge@gmail.com',
           message: 'テストテスト')
  end
  describe 'GET #index' do
    before do
      visit new_user_session_path
      fill_in 'user[email]', with: user.email
      fill_in 'user[password]', with: user.password
      click_button 'Log In'
    end
    it 'リクエストが成功すること' do
      get ('/contacts' + '/new')
      expect(response.status).to eq 302
    end
  end
end