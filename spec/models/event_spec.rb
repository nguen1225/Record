require 'rails_helper'

RSpec.describe 'eventモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    let(:user) { create(:user) }
    let!(:event) { build(:event, user_id: user.id) }

    context 'titleカラム' do
      it '空欄でないこと' do
        event.title = ''
        expect(event.valid?).to eq false
      end
    end
    context 'genreカラム' do
      it '空欄でないこと' do
        event.genre_id = nil
        expect(event.valid?).to eq false
      end
    end
  end
  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it 'N:1となっている' do
        expect(Event.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end
  end
end
