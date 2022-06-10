require 'rails_helper'

RSpec.feature "Tabis", type: :feature do

  let(:user) { create(:user) }
  let(:tabi) { create(:tabi, user: user) }

  describe '#create' do

    before do
      login_as(user)
      visit show_tabis_path(tabi.id)
    end

    scenario '画像をアップロードするとマイページに反映される' do
      visit edit_tabi_path(tabi.id)
      attach_file "tabi_tabi_photos", "spec/fixtures/files/test_image.jpg"
      click_on "更新する"
      visit show_tabis_path(tabi.id)
      expect(page).to have_selector("img")
    end
  end
end
