require 'test_helper'

class ShipmentsControllerTest < ActionController::TestCase
  setup do
    @shipment = shipments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:shipments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create shipment" do
    assert_difference('Shipment.count') do
      post :create, shipment: { cost: @shipment.cost, destination: @shipment.destination, equipment_type: @shipment.equipment_type, maximum_commitment: @shipment.maximum_commitment, minimum_commitment: @shipment.minimum_commitment, mode_of_transportation: @shipment.mode_of_transportation, origin: @shipment.origin }
    end

    assert_redirected_to shipment_path(assigns(:shipment))
  end

  test "should show shipment" do
    get :show, id: @shipment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @shipment
    assert_response :success
  end

  test "should update shipment" do
    patch :update, id: @shipment, shipment: { cost: @shipment.cost, destination: @shipment.destination, equipment_type: @shipment.equipment_type, maximum_commitment: @shipment.maximum_commitment, minimum_commitment: @shipment.minimum_commitment, mode_of_transportation: @shipment.mode_of_transportation, origin: @shipment.origin }
    assert_redirected_to shipment_path(assigns(:shipment))
  end

  test "should destroy shipment" do
    assert_difference('Shipment.count', -1) do
      delete :destroy, id: @shipment
    end

    assert_redirected_to shipments_path
  end
end
