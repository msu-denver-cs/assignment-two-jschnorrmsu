require 'test_helper'

class CarTest < ActiveSupport::TestCase


  test "empty make and empty model" do
    car =  Car.create({make_id: 1, model: "", VIN: "PR23"})
    refute car.valid?
    refute car.save
    assert_equal({:make=>["must exist","can't be blank"], :model=>["can't be blank", "is too short (minimum is 2 characters)"]},
                 car.errors.messages)
  end

  test "for a valid make and a one letter car model" do
    @make = makes(:one)
    car = Car.create({ make_id: @make.id, model: "a", VIN: "PR23"})
    refute car.valid?
    refute car.save
    assert_equal({:model=>["is too short (minimum is 2 characters)"]},
                 car.errors.messages)
  end

  test "for a valid make and a two letter car model (valid)" do
    @make = makes(:one)
    car = Car.create({ make_id: @make.id, model: "aa", VIN: "PR23"})
    assert car.valid?
    assert car.save
    assert_equal({}, car.errors.messages)
  end

  test "for a valid make, model, but a non-unique vin number" do
    @car = cars(:two)
    car = Car.create({ make_id: @car.make_id, model: @car.model, VIN: @car.VIN})
    refute car.valid?
    refute car.save
    assert_equal({:VIN=>["has already been taken"]}, car.errors.messages)
  end
end