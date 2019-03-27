require 'test_helper'

class SubjectTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  class SubjectTest < ActiveSupport::TestCase
    test "shold save with name" do
      subject = Subject.new
      subject.name = '数学'
      assert subject.save
    end
 
    test "shold not save with name" do
      subject = Subject.new
      assert_not subject.save
    end
 
    test "shold not save with 1 letter" do
      subject = Subject.new
      subject.name = '数'
      assert_not subject.save
    end
 
    test "shold save with 255 letters" do
      subject = Subject.new
      name = '数' * 255
      subject.name = name
      assert subject.save
    end
 
    test "shold not save with 256 letters" do
      subject = Subject.new
      name = '数' * 256
      subject.name = name
      assert_not subject.save
    end
    
    test "should not save with nill name" do
      subject = Subject.new
      name = ''
      subject.name = name
      assert_not subject.new
    end
 end
end
