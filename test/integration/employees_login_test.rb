require "test_helper"

class EmployeesLoginTest < ActionDispatch::IntegrationTest
  def setup
    @employee = employees(:avi)
  end

  test 'login with valid credentials' do
    get login_path
    assert_response :success
    assert_template 'sessions/new'
    post login_path, params: {
      email: @employee.email,
      password: 'foobarfoobar'
    }
    assert_equal @employee.id, session[:employee_id]
    assert_response :redirect
    follow_redirect!
    assert flash[:success]
    assert_template 'employees/show'
    # logout
    delete logout_path
    assert_response :redirect
    follow_redirect!
    assert_template 'static_pages/home'
    assert_not session[:employee_id]
    assert flash[:success]
  end

  test 'login with invalid credentials' do
    get login_path
    post login_path, params: { }
    assert_response :unauthorized
    assert flash[:danger]
    assert_template 'sessions/new'
  end
end
