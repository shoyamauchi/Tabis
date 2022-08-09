require 'rails_helper'

RSpec.describe Comment, type: :model do
    let(:user) { create(:user) }
    let(:tabi) { create(:tabi, user: user) }
    let(:comment) { create(:comment, tabi: tabi, user: user) }

  describe 'コメント機能' do
    context 'コメントを保存できる場合' do
      it "コメント文を入力済みであれば保存できる" do
        expect(comment).to be_valid
      end

      it "コメントが自分の投稿なら削除できる" do
        expect(comment).to be_valid
      end
    end

    context 'コメントを保存できない場合' do
      it "コメントが空では投稿できない" do
        comment.comment = nil
        comment.valid?
        expect(comment).not_to be_valid
      end

      it "ユーザーがログインしていなければコメントできない" do
        comment.user_id = nil
        comment.valid?
        expect(comment).not_to be_valid
      end

      it "投稿したものがなければコメントできない" do
        comment.tabi_id = nil
        comment.valid?
        expect(comment).not_to be_valid
      end
    end
  end
end
