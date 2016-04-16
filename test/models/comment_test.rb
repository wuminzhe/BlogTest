require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @comment = comments(:one)
  end

  test "valid" do
    assert @comment.valid?
  end

  test "user should be present" do
    @comment.user = "  "
    assert_not @comment.valid?
    @comment.user = ""
    assert_not @comment.valid?
  end

  test "body should be present" do
    @comment.body = "   "
    assert_not @comment.valid?
    @comment.body = ""
    assert_not @comment.valid?
  end
end
