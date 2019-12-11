require 'test_helper'

class PartsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @part = parts(:one)
  end

  test "shouldn't find a part name" do
    assert Part.where("part like ?", "NOT A PART").length == 0
  end

  test "should find part names from the fixture" do
    assert Part.where("part like ?", "PartOne").length == 1
  end

  test "searches always return 200" do
    get search_parts_url, params: { search: "Make" }
    assert_equal 200, status
  end

  test "should find PartOne" do
    get search_parts_url, params: { search: "PartOne" }
    assert_select 'td', 'PartOne'
  end

  test "should get index" do
    get parts_url
    assert_response :success
  end

  test "should get new" do
    get new_part_url
    assert_response :success
  end

  test "should create part" do
    assert_difference('Part.count') do
      post parts_url, params: { part: { part: @part.part } }
    end

    assert_redirected_to part_url(Part.last)
  end

  test "should not create unprocessable part" do
    assert_no_difference('Part.count') do
      post parts_url, params: { part: { part: "a" } }
    end

    assert_response :success
  end

  test "should show part" do
    get part_url(@part)
    assert_response :success
  end

  test "should get edit" do
    get edit_part_url(@part)
    assert_response :success
  end

  test "should update part" do
    patch part_url(@part), params: { part: { part: @part.part } }
    assert_redirected_to part_url(@part)
  end

  test "should not update unprocessable part" do
    patch part_url(@part), params: { part: { part: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa" } }
    assert_response :success
  end

  test "should destroy part" do
    assert_difference('Part.count', -1) do
      delete part_url(@part)
    end

    assert_redirected_to parts_url
  end
end
