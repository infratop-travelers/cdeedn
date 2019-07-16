require 'test_helper'

class ResignedCustomersControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get resigned_customers_create_url
    assert_response :success
  end

  test "should get destroy" do
    get resigned_customers_destroy_url
    assert_response :success
  end

end
