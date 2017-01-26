require 'test_helper'

class OfficesControllerTest < ActionController::TestCase
  setup do
    @office = offices(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:offices)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create office" do
    assert_difference('Office.count') do
      post :create, office: { address_line1: @office.address_line1, address_line2: @office.address_line2, city: @office.city, country_id: @office.country_id, created_at: @office.created_at, created_by: @office.created_by, delete_flg: @office.delete_flg, fax_number: @office.fax_number, office_name: @office.office_name, owner_name: @office.owner_name, phone_number: @office.phone_number, postal_code: @office.postal_code, prefecture: @office.prefecture, updated_at: @office.updated_at, updated_by: @office.updated_by }
    end

    assert_redirected_to office_path(assigns(:office))
  end

  test "should show office" do
    get :show, id: @office
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @office
    assert_response :success
  end

  test "should update office" do
    patch :update, id: @office, office: { address_line1: @office.address_line1, address_line2: @office.address_line2, city: @office.city, country_id: @office.country_id, created_at: @office.created_at, created_by: @office.created_by, delete_flg: @office.delete_flg, fax_number: @office.fax_number, office_name: @office.office_name, owner_name: @office.owner_name, phone_number: @office.phone_number, postal_code: @office.postal_code, prefecture: @office.prefecture, updated_at: @office.updated_at, updated_by: @office.updated_by }
    assert_redirected_to office_path(assigns(:office))
  end

  test "should destroy office" do
    assert_difference('Office.count', -1) do
      delete :destroy, id: @office
    end

    assert_redirected_to offices_path
  end
end
