require 'test_helper'

class CoinIcosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @coin_ico = coin_icos(:one)
  end

  test "should get index" do
    get coin_icos_url
    assert_response :success
  end

  test "should get new" do
    get new_coin_ico_url
    assert_response :success
  end

  test "should create coin_ico" do
    assert_difference('CoinIco.count') do
      post coin_icos_url, params: { coin_ico: { coin_name: @coin_ico.coin_name, description: @coin_ico.description, ico_end_date: @coin_ico.ico_end_date, launcher_id: @coin_ico.launcher_id, presentation_link: @coin_ico.presentation_link } }
    end

    assert_redirected_to coin_ico_url(CoinIco.last)
  end

  test "should show coin_ico" do
    get coin_ico_url(@coin_ico)
    assert_response :success
  end

  test "should get edit" do
    get edit_coin_ico_url(@coin_ico)
    assert_response :success
  end

  test "should update coin_ico" do
    patch coin_ico_url(@coin_ico), params: { coin_ico: { coin_name: @coin_ico.coin_name, description: @coin_ico.description, ico_end_date: @coin_ico.ico_end_date, launcher_id: @coin_ico.launcher_id, presentation_link: @coin_ico.presentation_link } }
    assert_redirected_to coin_ico_url(@coin_ico)
  end

  test "should destroy coin_ico" do
    assert_difference('CoinIco.count', -1) do
      delete coin_ico_url(@coin_ico)
    end

    assert_redirected_to coin_icos_url
  end
end
