require "application_system_test_case"

class ExamResultsTest < ApplicationSystemTestCase
  setup do
    @exam_result = exam_results(:one)
  end

  test "visiting the index" do
    visit exam_results_url
    assert_selector "h1", text: "Exam Results"
  end

  test "creating a Exam result" do
    visit exam_results_url
    click_on "New Exam Result"

    fill_in "Name", with: @exam_result.name
    fill_in "Score", with: @exam_result.score
    fill_in "Student", with: @exam_result.student_id
    fill_in "Subject", with: @exam_result.subject_id
    click_on "Create Exam result"

    assert_text "Exam result was successfully created"
    click_on "Back"
  end

  test "updating a Exam result" do
    visit exam_results_url
    click_on "Edit", match: :first

    fill_in "Name", with: @exam_result.name
    fill_in "Score", with: @exam_result.score
    fill_in "Student", with: @exam_result.student_id
    fill_in "Subject", with: @exam_result.subject_id
    click_on "Update Exam result"

    assert_text "Exam result was successfully updated"
    click_on "Back"
  end

  test "destroying a Exam result" do
    visit exam_results_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Exam result was successfully destroyed"
  end
end
