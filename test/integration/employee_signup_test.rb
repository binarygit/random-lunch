require "test_helper"

class EmployeeSignupTest < ActionDispatch::IntegrationTest
  test "invalid signup information" do
    get signup_path
    assert_response :success

    assert_no_difference "Employee.count" do
      post employees_path, params: { employee: { first_name: "Avi" }}
    end
    assert_response :unprocessable_entity
    assert_template 'employees/new'
    assert_select '#error_explanation'
  end
end
