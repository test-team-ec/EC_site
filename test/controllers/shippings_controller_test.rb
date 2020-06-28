require 'test_helper'

class ShippingsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get shippings_index_url
    assert_response :success
  end

  test "should get show" do
    get shippings_show_url
    assert_response :success
  end

  test "should get edit" do
    get shippings_edit_url
    assert_response :success
  end

  test "should get update" do
    get shippings_update_url
    assert_response :success
  end

  test "should get new" do
    get shippings_new_url
    assert_response :success
  end

  test "should get craete" do
    get shippings_craete_url
    assert_response :success
  end

  test "should get destroy" do
    get shippings_destroy_url
    assert_response :success
  end

end
