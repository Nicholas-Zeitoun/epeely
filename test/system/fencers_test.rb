require "application_system_test_case"

class FencersTest < ApplicationSystemTestCase
  setup do
    @fencer = fencers(:one)
  end

  test "visiting the index" do
    visit fencers_url
    assert_selector "h1", text: "Fencers"
  end

  test "should create fencer" do
    visit fencers_url
    click_on "New fencer"

    fill_in "Name", with: @fencer.name
    fill_in "Points", with: @fencer.points
    click_on "Create Fencer"

    assert_text "Fencer was successfully created"
    click_on "Back"
  end

  test "should update Fencer" do
    visit fencer_url(@fencer)
    click_on "Edit this fencer", match: :first

    fill_in "Name", with: @fencer.name
    fill_in "Points", with: @fencer.points
    click_on "Update Fencer"

    assert_text "Fencer was successfully updated"
    click_on "Back"
  end

  test "should destroy Fencer" do
    visit fencer_url(@fencer)
    click_on "Destroy this fencer", match: :first

    assert_text "Fencer was successfully destroyed"
  end
end
