require 'test_helper'

class CarsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @car = cars(:one)
  end

  test "shouldn't find a car" do
    assert Car.where("model like ?", "NOT A MODEL").length == 0
  end

  test "should find cars from the fixture" do
    assert Car.where("model like ?", "BMW").length == 1
  end

  test "searches always return 200" do
    get search_cars_url, params: { search: "Car" }
    assert_equal 200, status
  end

  test "should get index" do
    get cars_url
    assert_response :success
  end

  test "should get new" do
    get new_car_url
    assert_response :success
  end

  test "should create car" do
    assert_difference('Car.count') do
      post cars_url, params: { car: { make_id: @car.make_id, model: @car.model, VIN: "aaa" } }
    end

    assert_redirected_to car_url(Car.last)
  end

  test "should not create unprocessable car" do
    assert_no_difference('Car.count') do
      post cars_url, params: { car: { make_id: 100000, model: "a", VIN: "a" } }
    end

    assert_response :success
  end

  test "should find BMW" do
    get search_cars_url, params: { search: "BMW" }
    assert_select 'td', 'BMW'
  end

  test "should show car" do
    get car_url(@car)
    assert_response :success
  end

  test "should get edit" do
    get edit_car_url(@car)
    assert_response :success
  end

  test "should update car" do
    patch car_url(@car), params: { car: { make_id: @car.make_id, model: @car.model, VIN: @car.VIN } }
    assert_redirected_to car_url(@car)
  end

  test "should not update unprocessable car" do
    patch car_url(@car), params: { car: { make_id: 1000, model: "a", VIN: "a"} }
    assert_response :success
  end

  test "should destroy car" do
    assert_difference('Car.count', -1) do
      delete car_url(@car)
    end

    assert_redirected_to cars_url
  end
end
