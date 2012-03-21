require 'test_helper'

class InformationRequestsControllerTest < ActionController::TestCase
  setup do
    @information_request = information_requests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:information_requests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create information_request" do
    assert_difference('InformationRequest.count') do
      post :create, information_request: @information_request.attributes
    end

    assert_redirected_to information_request_path(assigns(:information_request))
  end

  test "should show information_request" do
    get :show, id: @information_request
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @information_request
    assert_response :success
  end

  test "should update information_request" do
    put :update, id: @information_request, information_request: @information_request.attributes
    assert_redirected_to information_request_path(assigns(:information_request))
  end

  test "should destroy information_request" do
    assert_difference('InformationRequest.count', -1) do
      delete :destroy, id: @information_request
    end

    assert_redirected_to information_requests_path
  end
end
