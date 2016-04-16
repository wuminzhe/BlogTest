require 'test_helper'

class TagTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @tag = tags(:one)
  end

  test "valid" do
    assert @tag.valid?
  end

  test "should not save tag without name" do
    tag = Tag.new
    assert_not tag.save
  end

  test "should save tag with a name" do
    assert_difference('Tag.count') do
      Tag.create(name: 'tag3')
    end
  end

  test "should not save tag if name is blank" do
    tag = Tag.new(name: ' ')
    assert_not tag.save
  end

  test "should support post and article at the same time" do
    @post = posts(:one)
    @article = articles(:one)
    @post.tags << tags(:one)
    @post.save
    @article.tags << tags(:one)
    @article.save

    tag = tags(:one)
    assert tag.posts.include?(@post) and tag.articles.include?(@article)
  end

end
