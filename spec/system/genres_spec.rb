require 'rails_helper'

describe 'genreのテスト' do
  let(:user) { create(:user) }
  let!(:user2) { create(:user) }
  let!(:genre) { create(:genre, user: user, name: 'ポテト')}
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
    let(:user) { create(:user) }
    let!(:user2) { create(:user) }
    let!(:genre) { create(:genre, user: user, name: 'ポテト')}
    before do
    visit new_user_session_path
    fill_in "user[email]", with: "2020@.com"
    fill_in 'user[password]', with: user.password
    click_button 'Log In'
    visit root_path
    end
  	context '自分の投稿の編集画面への遷移' do
  	  it '遷移できる' do
	  		visit edit_genre_path(genre)
	  		expect(current_path).to eq('/genres/' + genre.id.to_s + '/edit')
	  	end
	  end
		context '他人の投稿の編集画面への遷移' do
		  it '遷移できない' do
		    visit edit_genre_path(genre2)
		    expect(current_path).to eq('/genres/' + genre.id.to_s + 'edit')
		  end
		end
		context '表示の確認' do
			before do
				visit genres_path
			end
			it 'name編集フォームが表示される' do
				expect(page).to have_field 'genre[name]', with: genre.name
			end
		end
		context 'フォームの確認' do
			it '作成に成功する' do
				visit genres_path
        fill_in 'genre[name]', with: genre.name
				click_button '作成'
				#expect(page).to have_content 'successfully'
				expect(current_path).to eq ('/genres/')
			end
		end
	end

  describe '一覧画面のテスト' do
  	before do
  		visit genres_path
  	end
  end

  describe '一覧画面のテスト' do
  	context '自分・他人共通の投稿詳細画面の表示を確認' do
  		it '投稿のnameが表示される' do
  			visit genres_path
  			expect(page).to have_content genre.name
  		end
  	end
  	context '自分の投稿編集画面の表示を確認' do
  		it '投稿の編集リンクが表示される' do
  			visit genres_path
  			expect(page).to have_link '編集', href: edit_genre_path(genre)
  		end
  	end
  end
end