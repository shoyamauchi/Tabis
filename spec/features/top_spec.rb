require 'rails_helper'

RSpec.feature "Tabis", type: :feature do

  let(:user) { create(:user) }
  let!(:tabi) { create(:tabi, user: user) }
  let!(:tabi1) { create(:tabi, user: user) }
  let!(:tabi2) { create(:tabi, user: user) }
  let!(:tabi3) { create(:tabi, user: user) }
  let!(:tabi4) { create(:tabi, user: user) }
  let!(:tabi5) { create(:tabi, user: user) }
  let!(:tabi6) { create(:tabi, user: user) }
  let!(:tabi7) { create(:tabi, user: user) }
  let!(:tabi8) { create(:tabi, user: user) }

  background do
    sign_in user
    visit top_tabis_path
  end

  scenario "旅を投稿するをクリックするとnewページへいくこと" do
    within(".btn_box") do
      click_on "旅を投稿する"
      expect(page).to have_current_path(new_tabi_path)
    end
  end

  scenario "tabi.titleが表示されること" do
    expect(page).to have_content tabi.title
  end

  scenario "tabi_boxが8つ表示されること" do
    within(".tabi_photos") do
      expect(page).to have_selector ".tabi_box", count: 8
    end
  end

  scenario "ログインしたユーザーは自分の投稿した投稿が検索できること" do
    # 検索欄に検索キーワードを入力する
    fill_in 'q[title_or_content_or_address_cont]', with: '旅'
    # 検索ボタンをクリックする
    click_on "検索"
    # 検索結果があることを確認する
    visit search_tabis_path
    expect(page).to have_content("旅")
  end

end
