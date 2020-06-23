require 'rails_helper'

describe 'eventのテスト' do
  let(:user) { create(:user) }
  let!(:contact) { create(:contact, user: user, email: 'dewd@dde', message: 'ああああ') }
  before do
  	visit new_user_session_path
  	fill_in 'user[email]', with: user.email
  	fill_in 'user[password]', with: user.password
  	click_button 'Log In'
  end
  describe 'サイドバーのテスト' do
		context '表示の確認' do
		  it 'カテゴリーと表示される' do
        visit root_path
	    	click_button 'カテゴリー'
		  end
		end
  end

  describe '送信のテスト' do
  	context '管理者へのお問い合わせ画面への遷移' do
  	  it '遷移できる' do
	  		visit new_contact_path
	  		expect(current_path).to eq('/contacts' + '/new')
	  	end
	  end
		context '表示の確認' do
			before do
				visit new_contact_path
			end
			it 'emailフォームが表示される' do
				expect(page).to have_field 'contact[email]', with: contact.email
			end
			it 'messageフォームが表示される' do
				expect(page).to have_field 'contact[message]', with: contact.message
			end
      context 'フォームの確認' do
      it '送信に成功する' do
        visit new_contact_path
        click_button '送信'
        #expect(page).to have_content 'successfully'
        expect(current_path).to eq ('/contacts')
      end
      it '送信に失敗する' do
        visit new_contact_path
        fill_in contact[message], with: ''
        click_button '送信'
        expect(current_path).to eq ('/contacts')
      end
    end
		end
	end
end