require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  setup do
    @comment = comments(:one)
  end

  # 测试ajax请求时，要求返回json数据
  test "should create comment" do
    assert_difference('Comment.count') do
      post :create, comment: { body: @comment.body, user: @comment.user }, format: :json
    end

    assert_response :success
    assert_equal 'wuminzhe', JSON.parse(@response.body)['user']
  end

end
