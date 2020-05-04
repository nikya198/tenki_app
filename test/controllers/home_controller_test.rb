require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  setup do
    @prefectures = Prefecture.all
  end 


  test "should get root" do
    get root_url
    assert_response :success
  end

  test "should get index" do
    get home_index_url
    assert_response :success
  end

  # test "should get get_cities" do
  #   get home_get_cities_url
  #   assert_response :success
  # end

end
