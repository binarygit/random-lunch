require "test_helper"

class EmployeesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get new_employee_url
    assert_response :success
  end
end
