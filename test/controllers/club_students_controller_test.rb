require 'test_helper'

class ClubStudentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @club_student = club_students(:one)
  end

  test "should get index" do
    get club_students_url
    assert_response :success
  end

  test "should get new" do
    get new_club_student_url
    assert_response :success
  end

  test "should create club_student" do
    assert_difference('ClubStudent.count') do
      post club_students_url, params: { club_student: { club_id: @club_student.club_id, student: @club_student.student } }
    end

    assert_redirected_to club_student_url(ClubStudent.last)
  end

  test "should show club_student" do
    get club_student_url(@club_student)
    assert_response :success
  end

  test "should get edit" do
    get edit_club_student_url(@club_student)
    assert_response :success
  end

  test "should update club_student" do
    patch club_student_url(@club_student), params: { club_student: { club_id: @club_student.club_id, student: @club_student.student } }
    assert_redirected_to club_student_url(@club_student)
  end

  test "should destroy club_student" do
    assert_difference('ClubStudent.count', -1) do
      delete club_student_url(@club_student)
    end

    assert_redirected_to club_students_url
  end
end
