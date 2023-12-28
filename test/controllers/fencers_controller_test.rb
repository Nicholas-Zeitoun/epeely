require "test_helper"

class FencersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fencer = fencers(:one)
  end

  test "should get index" do
    get fencers_url
    assert_response :success
  end

  test "should get new" do
    get new_fencer_url
    assert_response :success
  end

  test "should create fencer" do
    assert_difference("Fencer.count") do
      post fencers_url, params: { fencer: { name: @fencer.name, points: @fencer.points } }
    end

    assert_redirected_to fencer_url(Fencer.last)
  end

  test "should show fencer" do
    get fencer_url(@fencer)
    assert_response :success
  end

  test "should get edit" do
    get edit_fencer_url(@fencer)
    assert_response :success
  end

  test "should update fencer" do
    patch fencer_url(@fencer), params: { fencer: { name: @fencer.name, points: @fencer.points } }
    assert_redirected_to fencer_url(@fencer)
  end

  test "should destroy fencer" do
    assert_difference("Fencer.count", -1) do
      delete fencer_url(@fencer)
    end

    assert_redirected_to fencers_url
  end
end
