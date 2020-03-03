require 'test_helper'

class XrootsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @xroot = xroots(:one)
  end

  test "should get index" do
    get xroots_url
    assert_response :success
  end

  test "should get new" do
    get new_xroot_url
    assert_response :success
  end

  test "should create xroot" do
    assert_difference('Xroot.count') do
      post xroots_url, params: { xroot: { code: @xroot.code, description: @xroot.description, name: @xroot.name, publish: @xroot.publish, synonym: @xroot.synonym, user_id: @xroot.user_id, version_date: @xroot.version_date } }
    end

    assert_redirected_to xroot_url(Xroot.last)
  end

  test "should show xroot" do
    get xroot_url(@xroot)
    assert_response :success
  end

  test "should get edit" do
    get edit_xroot_url(@xroot)
    assert_response :success
  end

  test "should update xroot" do
    patch xroot_url(@xroot), params: { xroot: { code: @xroot.code, description: @xroot.description, name: @xroot.name, publish: @xroot.publish, synonym: @xroot.synonym, user_id: @xroot.user_id, version_date: @xroot.version_date } }
    assert_redirected_to xroot_url(@xroot)
  end

  test "should destroy xroot" do
    assert_difference('Xroot.count', -1) do
      delete xroot_url(@xroot)
    end

    assert_redirected_to xroots_url
  end
end
