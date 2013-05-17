require 'test_helper'

class LocationsControllerTest < ActionController::TestCase
  setup do
    @location = locations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:locations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create location" do
    assert_difference('Location.count') do
      post :create, location: { bsi: @location.bsi, building: @location.building, exp_loc: @location.exp_loc, inspection_date: @location.inspection_date, inspector: @location.inspector, micro_qty: @location.micro_qty, microorg: @location.microorg, modification_id: @location.modification_id, protocol_id: @location.protocol_id, research_loc: @location.research_loc, rm_no: @location.rm_no, store_loc: @location.store_loc, ten_liter: @location.ten_liter, toxin: @location.toxin, toxin_qty: @location.toxin_qty }
    end

    assert_redirected_to location_path(assigns(:location))
  end

  test "should show location" do
    get :show, id: @location
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @location
    assert_response :success
  end

  test "should update location" do
    put :update, id: @location, location: { bsi: @location.bsi, building: @location.building, exp_loc: @location.exp_loc, inspection_date: @location.inspection_date, inspector: @location.inspector, micro_qty: @location.micro_qty, microorg: @location.microorg, modification_id: @location.modification_id, protocol_id: @location.protocol_id, research_loc: @location.research_loc, rm_no: @location.rm_no, store_loc: @location.store_loc, ten_liter: @location.ten_liter, toxin: @location.toxin, toxin_qty: @location.toxin_qty }
    assert_redirected_to location_path(assigns(:location))
  end

  test "should destroy location" do
    assert_difference('Location.count', -1) do
      delete :destroy, id: @location
    end

    assert_redirected_to locations_path
  end
end
