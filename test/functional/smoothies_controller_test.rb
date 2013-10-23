require 'test_helper'

class SmoothiesControllerTest < ActionController::TestCase
  setup do
    @smoothie = smoothies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:smoothies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create smoothie" do
    assert_difference('Smoothie.count') do
      post :create, smoothie: { desc: @smoothie.desc, rating: @smoothie.rating, url: @smoothie.url, user_id: @smoothie.user_id }
    end

    assert_redirected_to smoothie_path(assigns(:smoothie))
  end

  test "should show smoothie" do
    get :show, id: @smoothie
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @smoothie
    assert_response :success
  end

  test "should update smoothie" do
    put :update, id: @smoothie, smoothie: { desc: @smoothie.desc, rating: @smoothie.rating, url: @smoothie.url, user_id: @smoothie.user_id }
    assert_redirected_to smoothie_path(assigns(:smoothie))
  end

  test "should destroy smoothie" do
    assert_difference('Smoothie.count', -1) do
      delete :destroy, id: @smoothie
    end

    assert_redirected_to smoothies_path
  end
end
