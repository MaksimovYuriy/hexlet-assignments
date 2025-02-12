require "test_helper"

class PostCommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post_comment = post_comments(:one)
  end

  test "should get new" do
    @post = posts(:one)
    get new_post_post_comment_url(@post)
    assert_response :success
  end

  test "should create post_comment" do
    @post = posts(:one)
    post post_post_comments_url(@post), params: { post_comment: {body: 'test'} }
    comment = @post.post_comments.find_by(body: 'test')
    assert { comment }
    assert_redirected_to post_comment_url(comment)
  end

  test "should show post_comment" do
    get post_comment_url(@post_comment)
    assert_response :success
  end

  test "should get edit" do
    get edit_post_comment_url(@post_comment)
    assert_response :success
  end

  test "should update post_comment" do
    patch post_comment_url(@post_comment), params: { post_comment: { body: @post_comment.body, post_id: @post_comment.post_id } }
    assert_redirected_to post_comment_url(@post_comment)
  end

  test "should destroy post_comment" do
    post = @post_comment.post
    delete post_comment_path(@post_comment)

    assert { !PostComment.exists?(@post_comment.id) }
    assert_redirected_to post_path(post)
  end
end
