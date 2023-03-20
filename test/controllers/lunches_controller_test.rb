require "test_helper"

class LunchesControllerTest < ActionDispatch::IntegrationTest
  test 'should get show' do
    get upcoming_lunch_url
    assert_response :success

    get lunch_url(lunches(:upcoming_lunch))
    assert_response :success
  end
end
