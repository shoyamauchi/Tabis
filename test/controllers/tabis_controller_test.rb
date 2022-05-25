require "test_helper"

class TabisControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tabi = tabis(:one)
  end

  test "should get index" do
    get tabis_url
    assert_response :success
  end

  test "should get new" do
    get new_tabi_url
    assert_response :success
  end

  test "should create tabi" do
    assert_difference('Tabi.count') do
      post tabis_url, params: { tabi: { content: @tabi.content, title: @tabi.title } }
    end

    assert_redirected_to tabi_url(Tabi.last)
  end

  test "should show tabi" do
    get tabi_url(@tabi)
    assert_response :success
  end

  test "should get edit" do
    get edit_tabi_url(@tabi)
    assert_response :success
  end

  test "should update tabi" do
    patch tabi_url(@tabi), params: { tabi: { content: @tabi.content, title: @tabi.title } }
    assert_redirected_to tabi_url(@tabi)
  end

  test "should destroy tabi" do
    assert_difference('Tabi.count', -1) do
      delete tabi_url(@tabi)
    end

    assert_redirected_to tabis_url
  end
end
