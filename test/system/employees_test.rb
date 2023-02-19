require "application_system_test_case"

class EmployeesTest < ApplicationSystemTestCase
  test 'new employee signs up' do
    visit signup_url
    fill_in "Username", with: "Bobby"
    fill_in "Email", with: "bobby@bobby.com"
    fill_in "Password", with: "foobarfoobar"
    fill_in "Password confirmation", with: "foobarfoobar"
    click_on "Create Account"
    assert_text "Please check your email to confirm your account."
  end

  test 'employee logs in' do
    avi = employees(:avi)
    visit login_url
    fill_in "Email", with: avi.email
    fill_in "Password", with: "foobarfoobar"
    click_on "Login"
    assert_text "Welcome #{avi.username}"
  end
end
