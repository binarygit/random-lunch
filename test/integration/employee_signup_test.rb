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

  test "valid signup information" do
    get signup_path
    assert_difference "Employee.count" do
      post employees_path, params: { employee: {
        username: "Bobby",
        email: "bobby@bobby.com",
        password: 'foobarfoobar',
        password_confirmation: 'foobarfoobar'
      }}
    end

    assert_response :redirect
    follow_redirect!
    assert_template 'static_pages/home'
    assert flash[:notice]
  end
end
