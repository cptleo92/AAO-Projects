require "application_system_test_case"

class BenchesTest < ApplicationSystemTestCase
  setup do
    @bench = benches(:one)
  end

  test "visiting the index" do
    visit benches_url
    assert_selector "h1", text: "Benches"
  end

  test "creating a Bench" do
    visit benches_url
    click_on "New Bench"

    fill_in "Description", with: @bench.description
    fill_in "Lat", with: @bench.lat
    fill_in "Lng", with: @bench.lng
    click_on "Create Bench"

    assert_text "Bench was successfully created"
    click_on "Back"
  end

  test "updating a Bench" do
    visit benches_url
    click_on "Edit", match: :first

    fill_in "Description", with: @bench.description
    fill_in "Lat", with: @bench.lat
    fill_in "Lng", with: @bench.lng
    click_on "Update Bench"

    assert_text "Bench was successfully updated"
    click_on "Back"
  end

  test "destroying a Bench" do
    visit benches_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Bench was successfully destroyed"
  end
end
