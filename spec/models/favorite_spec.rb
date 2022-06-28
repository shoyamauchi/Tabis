require 'rails_helper'

RSpec.describe Favorite, type: :model do
    let(:user) { create(:user) }
    let(:tabi) { create(:tabi, user: user) }
    let(:favorite) { create(:favorite, tabi: tabi, user: user) }

  describe 'お気に入り機能' do
    context 'お気に入りできる場合' do
      it "お気に入り登録を押すと登録できる" do
        expect(favorite).to be_valid
      end
    end

    context 'お気に入り登録できない場合' do
      it "ユーザーがログインしていなければ登録できない" do
        favorite.user_id = nil
        favorite.valid?
        expect(favorite).not_to be_valid
      end

      it "投稿したものがなければ登録できない" do
        favorite.tabi_id = nil
        favorite.valid?
        expect(favorite).not_to be_valid
      end
    end
  end
end
