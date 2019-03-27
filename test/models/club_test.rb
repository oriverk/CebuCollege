require 'test_helper'

class ClubTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should save with name" do
    club = Club.new
    club.name = '数学'
    assert club.save
  end

  test "should not save without name" do
    club = Club.new
    club.name = ''
    assert_not club.save
  end

  test "should not save with 1 letter" do
    club = Club.new
    club.name = '数'
    assert_not club.save
  end

  test "should save with 255 letters" do
    club = Club.new
    name = '数' * 255
    club.name = name
    assert club.save
  end

  test "should not save with 256 letters" do
    club = Club.new
    name = '数' * 256
    club.name = name
    assert_not club.save
  end
end

