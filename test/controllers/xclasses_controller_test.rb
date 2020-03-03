require 'test_helper'

class XclassesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @xclass = xclasses(:one)
  end

  test "should get index" do
    get xclasses_url
    assert_response :success
  end

  test "should get new" do
    get new_xclass_url
    assert_response :success
  end

  test "should create xclass" do
    assert_difference('Xclass.count') do
      post xclasses_url, params: { xclass: { code: @xclass.code, description: @xclass.description, name: @xclass.name, publish: @xclass.publish, synonym: @xclass.synonym, user_id: @xclass.user_id, version_date: @xclass.version_date, xcategory_id: @xclass.xcategory_id } }
    end

    assert_redirected_to xclass_url(Xclass.last)
  end

  test "should show xclass" do
    get xclass_url(@xclass)
    assert_response :success
  end

  test "should get edit" do
    get edit_xclass_url(@xclass)
    assert_response :success
  end

  test "should update xclass" do
    patch xclass_url(@xclass), params: { xclass: { code: @xclass.code, description: @xclass.description, name: @xclass.name, publish: @xclass.publish, synonym: @xclass.synonym, user_id: @xclass.user_id, version_date: @xclass.version_date, xcategory_id: @xclass.xcategory_id } }
    assert_redirected_to xclass_url(@xclass)
  end

  test "should destroy xclass" do
    assert_difference('Xclass.count', -1) do
      delete xclass_url(@xclass)
    end

    assert_redirected_to xclasses_url
  end
end
