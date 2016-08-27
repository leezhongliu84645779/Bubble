require 'test_helper'

class ChatroompostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @chatroompost = chatroomposts(:one)
  end

  test "should get index" do
    get chatroomposts_url
    assert_response :success
  end

  test "should get new" do
    get new_chatroompost_url
    assert_response :success
  end

  test "should create chatroompost" do
    assert_difference('Chatroompost.count') do
      post chatroomposts_url, params: { chatroompost: { author: @chatroompost.author } }
    end

    assert_redirected_to chatroompost_url(Chatroompost.last)
  end

  test "should show chatroompost" do
    get chatroompost_url(@chatroompost)
    assert_response :success
  end

  test "should get edit" do
    get edit_chatroompost_url(@chatroompost)
    assert_response :success
  end

  test "should update chatroompost" do
    patch chatroompost_url(@chatroompost), params: { chatroompost: { author: @chatroompost.author } }
    assert_redirected_to chatroompost_url(@chatroompost)
  end

  test "should destroy chatroompost" do
    assert_difference('Chatroompost.count', -1) do
      delete chatroompost_url(@chatroompost)
    end

    assert_redirected_to chatroomposts_url
  end
end
