describe User do
  it "ユーザーモデルは有効なこと" do
    expect(FactoryBot.build(:user)).to be_valid 
  end

  it "emailがnillの時の処理が有効なこと" do
    user = FactoryBot.build(:user, email: nil)
    user.valid?
    expect(user.errors[:email]).to include("email.blank")
  end

  it "is invalid with a duplicate email address" do
    FactoryBot.create(:user, email: "test@example.com")
    user = FactoryBot.build(:user, email: "test@example.com")
    user.valid?
    expect(user.errors[:email]).to include("has already been taken")
  end
end

require 'rails_helper'
describe User do
  describe '#create' do
    it "nicknameがない場合は登録できないこと" do
      # user = User.new(nickname: "", email: "kkk@gmail.com",password: "00000000", password_confirmation: "00000000")
      user = build(:user, nickname: "")
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")
    end

    it "emailがない場合は登録できないこと" do
      # user = User.new(nickname: "nick", email: "",password: "00000000", password_confirmation: "00000000")
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end
  end
end