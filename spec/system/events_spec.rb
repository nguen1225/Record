require 'rails_helper'

describe '投稿のテスト' do
  let(:user) { create(:user) }
  let!(:user2) { create(:user) }
  let!(:genre) { create(:genre, user: user, name: 'ポテト')}
  let!(:event) { create(:event, user: user, title: 'じゃがいも', text: 'imo', genre: genre) }
  let!(:event2) { create(:event, user: user2, title: 'じゃがいもaaaaaaaaa', text: 'imoaaaa', genre: genre) }
  before do
  	visit new_user_session_path
  	fill_in 'user[email]', with: user.email
  	fill_in 'user[password]', with: user.password
  	click_button 'Log In'
  end
  describe 'サイドバーのテスト' do
		context '表示の確認' do
		  it 'Categorysと表示される' do
        visit root_path
	    	expect(page).to have_content 'Categorys'
		  end
		end
  end

  describe '編集のテスト' do
  	context '自分の投稿の編集画面への遷移' do
  	  it '遷移できる' do
	  		visit edit_event_path(event)
	  		expect(current_path).to eq('/events/' + event.id.to_s + '/edit')
	  	end
	  end
		context '他人の投稿の編集画面への遷移' do
		  it '遷移できない' do
		    visit edit_event_path(event2)
		    expect(current_path).to eq('/events')
		  end
		end
		context '表示の確認' do
			before do
				visit edit_event_path(event)
			end
			it 'Editing Eventと表示される' do
				expect(page).to have_content('Editing Event')
			end
			it 'title編集フォームが表示される' do
				expect(page).to have_field 'event[title]', with: event.title
			end
			it 'text編集フォームが表示される' do
				expect(page).to have_field 'event[text]', with: event.text
			end
      it 'value編集フォームが表示される' do
        expect(page).to have_field 'event[value]', with: event.value
      end
       it 'genre編集フォームが表示される' do
        expect(page).to have_field 'event[genre_id]', with: event.genre_id
      end
       it 'start_date編集フォームが表示される' do
        expect(page).to have_field 'event[start_date]', with: event.start_date
      end
       it 'end_date編集フォームが表示される' do
        expect(page).to have_field 'event[end_date]', with: event.end_date
      end
       it 'alarm編集フォームが表示される' do
        expect(page).to have_field 'event[alarm]', with: event.alarm
      end
			it 'Showリンクが表示される' do
				expect(page).to have_link 'Show', href: event_path(event)
			end
			it 'Backリンクが表示される' do
				expect(page).to have_link 'Back', href: events_path
			end
		end
		context 'フォームの確認' do
			it '編集に成功する' do
				visit edit_event_path(event)
				click_button 'Create'
				#expect(page).to have_content 'successfully'
				expect(current_path).to eq '/events/' + event.id.to_s
			end
			it '編集に失敗する' do
				visit edit_event_path(event)
				fill_in 'event[title]', with: ''
				click_button 'Create'
				expect(page).to have_content 'error'
				expect(current_path).to eq '/events/' + event.id.to_s
			end
		end
	end

  describe '一覧画面のテスト' do
  	before do
  		visit events_path
  	end
  	context '表示の確認' do
  		it 'Eventsと表示される' do
  			expect(page).to have_content 'Events'
  		end
  	end
  end

  describe '詳細画面のテスト' do
  	context '自分・他人共通の投稿詳細画面の表示を確認' do
  		it 'Eventと表示される' do
  			visit event_path(event)
  			expect(page).to have_content 'Event'
  		end
  		it '投稿のtitleが表示される' do
  			visit event_path(event)
  			expect(page).to have_content event.title
  		end
  		it '投稿のtextが表示される' do
  			visit event_path(event)
  			expect(page).to have_content event.text
  		end
  	end
  	context '自分の投稿詳細画面の表示を確認' do
  		it '投稿の編集リンクが表示される' do
  			visit event_path event
  			expect(page).to have_link 'Edit', href: edit_event_path(event)
  		end
  		it '投稿の削除リンクが表示される' do
  			visit event_path event
  			expect(page).to have_link 'Destroy', href: event_path(event)
  		end
  	end
  	context '他人の投稿詳細画面の表示を確認' do
  		it '投稿の編集リンクが表示されない' do
  			visit event_path(event2)
  			expect(page).to have_no_link 'Edit', href: edit_eventk_path(event2)
  		end
  		it '投稿の削除リンクが表示されない' do
  			visit event_path(event2)
  			expect(page).to have_no_link 'Destroy', href: event_path(event2)
  		end
  	end
  end
end