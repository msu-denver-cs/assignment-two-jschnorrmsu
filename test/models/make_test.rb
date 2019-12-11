require 'test_helper'

class MakeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "for empty make name and country" do
    make = Make.create({:name => "", :country => ""})
    refute make.valid?
    refute make.save
    assert_equal({:name=>["is too short (minimum is 2 characters)"], :country =>["is too short (minimum is 2 characters)"]},
                 make.errors.messages)
  end

  test "for one character make name" do
    make = Make.create({:name => "a", :country => "a"})
    refute make.valid?
    refute make.save
    assert_equal({:name=>["is too short (minimum is 2 characters)"], :country =>["is too short (minimum is 2 characters)"]},
                 make.errors.messages)
  end

  test "for two character names (valid)" do
    make = Make.create({:name => "aa", :country => "USA"})
    assert make.valid?
    assert make.save
    assert_equal({}, make.errors.messages)
  end
end
