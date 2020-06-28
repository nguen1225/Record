require 'rails_helper'

describe 'eventのテスト' do
  let(:user) { create(:user) }
  let!(:user2) { create(:user) }
  let!(:genre) { create(:genre, user: user, name: '予定')}
  let!(:event) { create(:event,
    user: user,
    title: '勉強',
    text: '10時間',
    genre: genre,
    start_date: DateTime.new(2020, 2, 24, 12, 30),
    end_date: DateTime.new(2020, 2, 25, 12, 30),
    alarm: 'on'
  ) }
  let!(:event2) { create(:event, user: user2, 
                                title: '遊び', 
                                　text: '神戸に行く', 
                                genre: genre) 
}
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
		    expect(current_path).to eq('/')
		  end
		end
		context '表示の確認' do
			before do
				visit edit_event_path(event)
			end
			it '投稿編集と表示される' do
        #binding.pry
				expect(page).to have_content('投稿編集')
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
        expect(page).to have_field 'event[start_date(1i)]', with: '2020'
        expect(page).to have_field 'event[start_date(2i)]', with: '2'
        expect(page).to have_field 'event[start_date(3i)]', with: '24'
        expect(page).to have_field 'event[start_date(4i)]', with: '12'
        expect(page).to have_field 'event[start_date(5i)]', with: '30'
      end
       it 'end_date編集フォームが表示される' do
        expect(page).to have_field 'event[end_date(1i)]', with: '2020'
        expect(page).to have_field 'event[end_date(2i)]', with: '2'
        expect(page).to have_field 'event[end_date(3i)]', with: '25'
        expect(page).to have_field 'event[end_date(4i)]', with: '12'
        expect(page).to have_field 'event[end_date(5i)]', with: '30'
      end
       it 'alarm編集フォームが表示される' do
        expect(page).to have_field 'event[alarm]', with: event.alarm
      end
			it '戻るリンクが表示される' do
				expect(page).to have_link '戻る', href: 'javascript:history.back()'
			end
		end
		context 'フォームの確認' do
			it '編集に成功する' do
				visit edit_event_path(event)
				click_button '作成'
				expect(current_path).to eq '/events/' + event.id.to_s
			end
		end
	end

  describe '一覧画面のテスト' do
  	before do
  		visit events_path
  	end
  	context '表示の確認' do
  		it '投稿と表示される' do
  			expect(page).to have_content '投稿一覧'
  		end
  	end
  end

  describe '詳細画面のテスト' do
  	context '自分・他人共通の投稿詳細画面の表示を確認' do
  		it '詳細と表示される' do
  			visit event_path(event)
  			expect(page).to have_content '詳細'
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
  			expect(page).to have_link '編集', href: edit_event_path(event)
  		end
  	end
  	context '他人の投稿詳細画面の表示を確認' do
  		it '投稿の編集リンクが表示されない' do
  			visit event_path(event2)
  			expect(page).to have_no_link '編集', href: edit_event_path(event2)
  		end
  		it '投稿の削除リンクが表示されない' do
  			visit event_path(event2)
  			expect(page).to have_no_link '削除', href: event_path(event2)
  		end
  	end
  end
end