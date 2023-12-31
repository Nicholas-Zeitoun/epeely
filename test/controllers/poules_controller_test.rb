require "test_helper"

class PoulesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @poule = poules(:one)
  end

  test "should get index" do
    get poules_url
    assert_response :success
  end

  test "should get new" do
    get new_poule_url
    assert_response :success
  end

  test "should create poule" do
    assert_difference("Poule.count") do
      post poules_url, params: { poule: {  } }
    end

    assert_redirected_to poule_url(Poule.last)
  end

  test "should show poule" do
    get poule_url(@poule)
    assert_response :success
  end

  test "should get edit" do
    get edit_poule_url(@poule)
    assert_response :success
  end

  test "should update poule" do
    patch poule_url(@poule), params: { poule: {  } }
    assert_redirected_to poule_url(@poule)
  end

  test "should destroy poule" do
    assert_difference("Poule.count", -1) do
      delete poule_url(@poule)
    end

    assert_redirected_to poules_url
  end
end
