require 'test_helper'

class XcategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @xcategory = xcategories(:one)
  end

  test "should get index" do
    get xcategories_url
    assert_response :success
  end

  test "should get new" do
    get new_xcategory_url
    assert_response :success
  end

  test "should create xcategory" do
    assert_difference('Xcategory.count') do
      post xcategories_url, params: { xcategory: { code: @xcategory.code, description: @xcategory.description, name: @xcategory.name, publish: @xcategory.publish, synonym: @xcategory.synonym, user_id: @xcategory.user_id, version_date: @xcategory.version_date, xroot_id: @xcategory.xroot_id } }
    end

    assert_redirected_to xcategory_url(Xcategory.last)
  end

  test "should show xcategory" do
    get xcategory_url(@xcategory)
    assert_response :success
  end

  test "should get edit" do
    get edit_xcategory_url(@xcategory)
    assert_response :success
  end

  test "should update xcategory" do
    patch xcategory_url(@xcategory), params: { xcategory: { code: @xcategory.code, description: @xcategory.description, name: @xcategory.name, publish: @xcategory.publish, synonym: @xcategory.synonym, user_id: @xcategory.user_id, version_date: @xcategory.version_date, xroot_id: @xcategory.xroot_id } }
    assert_redirected_to xcategory_url(@xcategory)
  end

  test "should destroy xcategory" do
    assert_difference('Xcategory.count', -1) do
      delete xcategory_url(@xcategory)
    end

    assert_redirected_to xcategories_url
  end
end
