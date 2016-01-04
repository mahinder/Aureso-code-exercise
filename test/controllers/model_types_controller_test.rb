require 'test_helper'

class ModelTypesControllerTest < ActionController::TestCase
  setup do
    @model_type = model_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:model_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create model_type" do
    assert_difference('ModelType.count') do
      post :create, model_type: { base_price: @model_type.base_price, model_type_code: @model_type.model_type_code, name: @model_type.name, slug: @model_type.slug }
    end

    assert_redirected_to model_type_path(assigns(:model_type))
  end

  test "should show model_type" do
    get :show, id: @model_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @model_type
    assert_response :success
  end

  test "should update model_type" do
    patch :update, id: @model_type, model_type: { base_price: @model_type.base_price, model_type_code: @model_type.model_type_code, name: @model_type.name, slug: @model_type.slug }
    assert_redirected_to model_type_path(assigns(:model_type))
  end

  test "should destroy model_type" do
    assert_difference('ModelType.count', -1) do
      delete :destroy, id: @model_type
    end

    assert_redirected_to model_types_path
  end
end
