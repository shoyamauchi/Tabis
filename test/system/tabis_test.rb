require "application_system_test_case"

class TabisTest < ApplicationSystemTestCase
  setup do
    @tabi = tabis(:one)
  end

  test "visiting the index" do
    visit tabis_url
    assert_selector "h1", text: "Tabis"
  end

  test "creating a Tabi" do
    visit tabis_url
    click_on "New Tabi"

    fill_in "Content", with: @tabi.content
    fill_in "Title", with: @tabi.title
    click_on "Create Tabi"

    assert_text "Tabi was successfully created"
    click_on "Back"
  end

  test "updating a Tabi" do
    visit tabis_url
    click_on "Edit", match: :first

    fill_in "Content", with: @tabi.content
    fill_in "Title", with: @tabi.title
    click_on "Update Tabi"

    assert_text "Tabi was successfully updated"
    click_on "Back"
  end

  test "destroying a Tabi" do
    visit tabis_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Tabi was successfully destroyed"
  end
end
