require 'rails_helper'

RSpec.feature "Tabis", type: :feature do

  let(:user) { create(:user) }
  let(:tabi) { create(:tabi, user: user) }

  background do
    sign_in user
    visit show_tabis_path(tabi.id)
  end

  scenario "tabi.titleが表示されること" do
    expect(page).to have_content tabi.title
  end

  scenario "tabi.start_dateを表示すること" do
    expect(page).to have_content tabi.start_date.to_s
  end

  scenario "tabi.user.nameが表示されること" do
    expect(page).to have_content tabi.user.name
  end

  scenario "tabi.contentが表示されること" do
    expect(page).to have_content tabi.content
  end

  scenario "tabi.addressが表示されること" do
    expect(page).to have_content tabi.address
  end

end
