require 'test_helper'

class CartItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get cart_items_index_url
    assert_response :success
  end

  test "should get destroy" do
    get cart_items_destroy_url
    assert_response :success
  end

  test "should get confirm" do
    get cart_items_confirm_url
    assert_response :success
  end

end
