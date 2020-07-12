require 'rails_helper'

RSpec.describe 'Users::events', type: :request do
  let(:user) { create(:user) }
  let!(:user2) { create(:user) }
  let!(:genre) { create(:genre, user: user, name: '予定') }
  let!(:event) do
    create(:event,
           user: user,
           title: '勉強',
           text: '10時間',
           genre: genre,
           start_date: DateTime.new(2020, 2, 24, 12, 30),
           end_date: DateTime.new(2020, 2, 25, 12, 30),
           alarm: 'on')
  end
  let!(:event2) do
    create(:event,
           user: user2,
           title: '遊び',
           text: '神戸に行く',
           genre: genre)
  end

  describe 'GET #index' do
    before do
      visit new_user_session_path
      fill_in 'user[email]', with: user.email
      fill_in 'user[password]', with: user.password
      click_button 'Log In'
    end
    it 'リクエストが成功すること' do
      get events_url
      expect(response.status).to eq 302
    end
  end

  describe 'POST #create' do
    context '不正なパラメータの場合' do
      it 'リクエストが成功すること' do
        post events_url, params: { event: attributes_for(:event) }
        expect(response.status).to eq 302
      end
    end
  end
end
