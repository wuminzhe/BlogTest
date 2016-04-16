require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @post = posts(:one)
  end

  test "valid" do
    assert @post.valid?
  end

  test "title should be present" do
    @post.title = "     "
    assert_not @post.valid?
    @post.title = ""
    assert_not @post.valid?
  end

  test "body should be present" do
    @post.body = "   "
    assert_not @post.valid?
    @post.body = ""
    assert_not @post.valid?
  end

  test "top3_comments should return a comment list" do
    @post.comments << comments(:one)
    @post.save
    assert_kind_of Comment, @post.top3_comments[0]
    @post.comments << comments(:two)
    @post.comments << comments(:three)
    @post.comments << comments(:four)
    @post.save
    assert_equal 3, @post.top3_comments.size
  end

  test "tags_string should return a string with comma" do
    assert_equal '', @post.tags_string
    @post.tags << tags(:one)
    @post.tags << tags(:two)
    assert_equal 'tag1, tag2', @post.tags_string
  end

  test "post should have a comments desc" do
    @post.comments << comments(:one)
    @post.comments << comments(:two)
    @post.save
    assert @post.comments[0].created_at.to_i > @post.comments[1].created_at.to_i
  end

end
