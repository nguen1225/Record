require 'rails_helper'

RSpec.describe 'Contactモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    let(:user) { create(:user) }
    let!(:contact) { build(:contact, user_id: user.id) }

    context 'emailカラム' do
      it '空欄でないこと' do
        contact.email = ''
        expect(contact.valid?).to eq false;
      end
    end
    context 'textカラム' do
      it '空欄でないこと' do
        contact.message = ''
        expect(contact.valid?).to eq false;
      end
      it '500文字以下であること' do
        contact.message = Faker::Lorem.characters(number:501)
        expect(contact.valid?).to eq false;
      end
    end
  end
  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it 'N:1となっている' do
        expect(Contact.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end
  end
end