require 'test_helper'

class PostsControllerTest < ActionController::TestCase
  setup do
    @post = posts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:posts)
  end

  test "index should return a post list with time desc" do
    get :index
    posts = assigns(:posts)
    one = posts[0]
    two = posts[1]
    assert one.created_at.to_i > two.created_at.to_i
  end

  test "should create post" do
    assert_difference('Post.count') do
      post :create, post: { body: @post.body, title: @post.title, tags_string: 'tag1, tag2' }
    end

    assert_redirected_to post_path(assigns(:post))
    assert_equal 'Blog was successfully created.', flash[:notice]
  end

  test "should show post" do
    get :show, id: @post
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @post
    assert_response :success
  end

  test "should update post" do
    patch :update, id: @post, post: { body: @post.body, title: @post.title, tags_string: 'tag1, tag2' }
    assert_redirected_to post_path(assigns(:post))
  end

  test "should destroy post" do
    assert_difference('Post.count', -1) do
      delete :destroy, id: @post
    end

    assert_redirected_to posts_path
  end


end
