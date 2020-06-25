require 'rails_helper'

RSpec.describe 'Userモデルのテスト', type: :model do

  describe 'アソシエーションのテスト' do
    context 'Eventモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:events).macro).to eq :has_many
      end
    end
  end
  describe 'アソシエーションのテスト' do
    context 'Genreモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:genres).macro).to eq :has_many
      end
    end
  end
end