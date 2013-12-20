require 'test_helper'

class EtherpadsControllerTest < ActionController::TestCase
  setup do
    @etherpad = etherpads(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:etherpads)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create etherpad" do
    assert_difference('Etherpad.count') do
      post :create, etherpad: {  }
    end

    assert_redirected_to etherpad_path(assigns(:etherpad))
  end

  test "should show etherpad" do
    get :show, id: @etherpad
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @etherpad
    assert_response :success
  end

  test "should update etherpad" do
    patch :update, id: @etherpad, etherpad: {  }
    assert_redirected_to etherpad_path(assigns(:etherpad))
  end

  test "should destroy etherpad" do
    assert_difference('Etherpad.count', -1) do
      delete :destroy, id: @etherpad
    end

    assert_redirected_to etherpads_path
  end
end
