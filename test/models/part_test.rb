Learn more or give us feedback
require 'test_helper'

class PartTest < ActiveSupport::TestCase
  test "for empty part name" do
    part = Part.create({:part => ""})
    refute part.valid?
    refute part.save
    assert_equal({:part=>["is too short (minimum is 2 characters)"]},
                 part.errors.messages)
  end

  test "for one character part name" do
    part = Part.create({:part => "b"})
    refute part.valid?
    refute part.save
    assert_equal({:part=>["is too short (minimum is 2 characters)"]},
                 part.errors.messages)
  end

  test "for two character name (valid)" do
    part = Part.create({:part => "aa"})
    assert part.valid?
    assert part.save
    assert_equal({}, part.errors.messages)
  end

end
