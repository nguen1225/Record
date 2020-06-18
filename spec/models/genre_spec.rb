require 'rails_helper'

RSpec.describe 'Genreモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    let(:user) { create(:user) }
    let!(:genre) { build(:genre, user_id: user.id) }

    context 'nameカラム' do
      it '空欄でないこと' do
        genre.name = ''
        expect(genre.valid?).to eq false;
      end
    end
  end
  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it 'N:1となっている' do
        expect(Genre.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end
  end
end