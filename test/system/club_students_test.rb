require "application_system_test_case"

class ClubStudentsTest < ApplicationSystemTestCase
  setup do
    @club_student = club_students(:one)
  end

  test "visiting the index" do
    visit club_students_url
    assert_selector "h1", text: "Club Students"
  end

  test "creating a Club student" do
    visit club_students_url
    click_on "New Club Student"

    fill_in "Club", with: @club_student.club_id
    fill_in "Student", with: @club_student.student
    click_on "Create Club student"

    assert_text "Club student was successfully created"
    click_on "Back"
  end

  test "updating a Club student" do
    visit club_students_url
    click_on "Edit", match: :first

    fill_in "Club", with: @club_student.club_id
    fill_in "Student", with: @club_student.student
    click_on "Update Club student"

    assert_text "Club student was successfully updated"
    click_on "Back"
  end

  test "destroying a Club student" do
    visit club_students_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Club student was successfully destroyed"
  end
end
