require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    #1
    it "nameとemail、passwordとpassword_confirmationが存在すれば登録できること" do
      user = build(:user)
      expect(user).to be_valid
    end

    #2
    it "nameがない場合は登録できないこと" do
      user = build(:user, name: "")
      user.valid?
      expect(user.errors[:name]).to include("を入力してください")
    end

    #3
    it "emailがない場合は登録できないこと" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    #4
    it "passwordがない場合は登録できないこと" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("は内容が入力されていません。")
    end

    #5
    it "passwordが存在してもpassword_confirmationがない場合は登録できないこと" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("を入力してください")
    end

    #6
    it "nameが15文字以上であれば登録できないこと" do
      user = build(:user, name: "abcdefghijklmnop")
      user.valid?
      expect(user.errors[:name]).to include("は15文字以内で入力してください")
    end

    #7
    it "nameが15文字以下では登録できること" do
      user = build(:user, name: "abcde")
      expect(user).to be_valid
    end

    #8
    it "重複したemailが存在する場合登録できないこと" do
      user1 = create(:user, email: "test@example.com")
      user2 = build(:user, email: "test@example.com")
      user2.valid?
      expect(user2.errors[:email]).to include("はすでに存在します")
    end

    #9
    it "passwordが8文字以上であれば登録できること" do
      user = build(:user, password: "12345678", password_confirmation: "12345678")
      expect(user).to be_valid
    end

    #10
    it "passwordが8文字以下であれば登録できないこと" do
      user = build(:user, password: "12345", password_confirmation: "12345")
      user.valid?
      expect(user.errors[:password]).to include("は8文字以上で入力してください")
    end
  end
end
